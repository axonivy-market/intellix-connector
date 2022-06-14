package com.axonivy.connector.intellix.connector;

import java.io.IOException;
import java.net.URI;
import java.util.Map;
import java.util.Map.Entry;

import javax.ws.rs.Priorities;
import javax.ws.rs.client.ClientRequestContext;
import javax.ws.rs.client.ClientRequestFilter;
import javax.ws.rs.client.ClientResponseContext;
import javax.ws.rs.client.ClientResponseFilter;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Configuration;
import javax.ws.rs.core.Feature;
import javax.ws.rs.core.FeatureContext;
import javax.ws.rs.core.Form;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;

import ch.ivyteam.ivy.data.cache.IDataCacheEntry;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.rest.client.FeatureConfig;
import ch.ivyteam.ivy.rest.client.internal.ExternalRestWebServiceCall;

/**
 * Feature to make sure, that we have the DocuWare cookies.
 *
 * If they are not there, make a login request.
 */
@SuppressWarnings("restriction")
public class IntellixAuthFeature implements Feature, ClientRequestFilter, ClientResponseFilter {

	private static final String ACCOUNT_LOGON_PATH = "Account/Login";
	private static final String USERNAME_PROPERTY = "UserName";
	private static final String PASSWORD_PROPERTY = "Password";
	private static final String LOGONURL_PROPERTY = "LogonUrl";

	@Override
	public boolean configure(FeatureContext context) {
		Ivy.log().debug("DocuWare feature configure.");
		invalidateCookiesCacheEntry();
		context.register(this, Priorities.AUTHORIZATION);
		return true;
	}

	@Override
	public void filter(ClientRequestContext reqContext) throws IOException {
		if(isLogonRequest(reqContext.getUri())) {
			Ivy.log().info("DocuWare logon request.");
		}
		else {
			if(getCookies() == null) {
				Ivy.log().info("DocuWare logon, fetching cookies.");

				Configuration configuration = reqContext.getConfiguration();

				FeatureConfig config = new FeatureConfig(configuration, IntellixAuthFeature.class);

				Form form = new Form()
						.param("UserName", config.readMandatory(USERNAME_PROPERTY))
						.param("Password", config.readMandatory(PASSWORD_PROPERTY))
						;

				String logonUrl = config.read(LOGONURL_PROPERTY).orElse(null);

				if(StringUtils.isBlank(logonUrl) || logonUrl.trim().equalsIgnoreCase("AUTO")) {
					try {
						// Note: this API is not public and will probably change in future Ivy versions.
						ExternalRestWebServiceCall externalRestWebServiceCall = (ExternalRestWebServiceCall) reqContext.getProperty(ExternalRestWebServiceCall.class.getCanonicalName());
						if(externalRestWebServiceCall != null) {
							// String host = Ivy.var().get("docuware-connector.host");
							String host = reqContext.getUri().getHost();

							logonUrl = externalRestWebServiceCall.getWebTarget().resolveTemplate("host", host).path(ACCOUNT_LOGON_PATH).getUri().toString();
						}
					} catch (Throwable t) {
						String message = String.format("Could not determine DocuWare target URL automatically, please set it in REST client property '%s'. Put there the same URL as used for the client.", LOGONURL_PROPERTY);
						Ivy.log().error(message, t);
						reqContext.abortWith(Response.status(Response.Status.PRECONDITION_FAILED)
								.type(MediaType.TEXT_PLAIN)
								.entity(message)
								.build());
					}
				}

				Ivy.log().info("DocuWare logon via URL {0}", logonUrl);

				Response response = logon(reqContext, form, logonUrl);

				Ivy.log().info("DocuWare logon returned with status {0}", response.getStatusInfo());

				if(getCookies() == null) {
					Ivy.log().error("DocuWare logon, still missing DocuWare cookies for context {0} after logon.", reqContext);
				}
			}

			requestHook(reqContext);
		}
	}

	protected Response logon(ClientRequestContext reqContext, Form form, String target) {
		Response response = reqContext.getClient()
				.target(target)
				.request(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
				.accept(MediaType.APPLICATION_JSON)
				.post(Entity.form(form));
		return response;
	}

	/**
	 * Manipulate request if needed (probably only useful for tests).
	 *
	 * @param reqContext
	 */
	protected void requestHook(ClientRequestContext reqContext) {
	}

	@Override
	public void filter(ClientRequestContext reqContext, ClientResponseContext rspContext) throws IOException {
		if(isLogonRequest(reqContext.getUri())) {
			int status = rspContext.getStatus();
			if(status >= 200 && status < 300) {
				Ivy.log().info("DocuWare logon successful: Status: {1}", status);

				DocuWareCookies docuWareCookies = DocuWareCookies.create(rspContext.getCookies());
				if(true) {
					setCookiesCacheEntry(docuWareCookies);
				}
			}
			else {
				Ivy.log().error("DocuWare logon unsuccessful, URI: {0} Status: {1}", reqContext.getUri(), status);
			}
		}
	}

	/**
	 * Get the DocuWare cookies from the session.
	 */
	public DocuWareCookies getCookies() {
		DocuWareCookies docuWareCookies = null;
		try {
			IDataCacheEntry entry = getCookiesCacheEntry();
			if(entry == null || !entry.isValid()) {
				Ivy.log().info("Got expired DocuWare cookies.");
			}
			else {
				docuWareCookies = (DocuWareCookies) entry.getValue();
			}
		} catch (Exception e) {
			Ivy.log().error("Exception while getting cached DocuWare cookies.", e);
		}
		return docuWareCookies;
	}

	/**
	 * Get the cache entry of the DocuWare cookies.
	 */
	public IDataCacheEntry getCookiesCacheEntry() {
		return Ivy.datacache().getAppCache().getEntry(DocuWareCookies.DW_COOKIES_CACHE_GROUP_ID, DocuWareCookies.DW_COOKIES_CACHE_ID);
	}

	/**
	 * Cache the DocuWare cookies.
	 *
	 * @param docuWareCookies
	 */
	public void setCookiesCacheEntry(DocuWareCookies docuWareCookies) {
		Ivy.log().info("Caching new DocuWare cookies: {0}", docuWareCookies);
		Ivy.datacache().getAppCache().setEntry(DocuWareCookies.DW_COOKIES_CACHE_GROUP_ID, DocuWareCookies.DW_COOKIES_CACHE_ID, DocuWareCookies.DW_COOKIES_EXPIRY_SECONDS, docuWareCookies);
	}

	/**
	 * Invalidate the cached DocuWare cookies.
	 */
	public void invalidateCookiesCacheEntry() {
		IDataCacheEntry entry = getCookiesCacheEntry();
		if(entry != null) {
			Ivy.log().info("Invalidating DocuWare cookies: {0}", entry.getValue());
			entry.invalidate();
		}
	}

	/**
	 * Is this a logon request?
	 * @param uri
	 */
	private boolean isLogonRequest(URI uri) {
		return uri != null && uri.toString().endsWith(ACCOUNT_LOGON_PATH);
	}

	/**
	 * Container for the cookies from DocuWare.
	 *
	 * The DocuWare Cookies have a very long life-time (some days), but here
	 * we go down to one day. It will be longer than the Ivy session.
	 */
	public static class DocuWareCookies {
		public static final String DW_COOKIES_CACHE_ID = "cookies";
		public static final String DW_COOKIES_CACHE_GROUP_ID = "com.docuware.cookies";
		public static final int DW_COOKIES_EXPIRY_SECONDS = 86400;
                private final Map<String, NewCookie> cookies;


		private DocuWareCookies(Map<String, NewCookie> cookies) {
			if(Ivy.log().isDebugEnabled()) {
				for (Entry<String, NewCookie> entry : cookies.entrySet()) {
					NewCookie cookie = entry.getValue();
					Ivy.log().debug("Received cookie: {0}: Name: {1} Expiry: {2} Max Age: {3}", entry.getKey(), cookie.getName(), cookie.getExpiry(), cookie.getMaxAge());
				}
			}
			this.cookies = cookies;
		}

		/**
		 * Create a new {@link DocuWareCookies} from the cookies received in the REST client response.
		 *
		 * @param cookies
		 */
		public static DocuWareCookies create(Map<String, NewCookie> cookies) {
			DocuWareCookies docuWareCookies = new DocuWareCookies(cookies);
			return docuWareCookies;
		}

	}
}
