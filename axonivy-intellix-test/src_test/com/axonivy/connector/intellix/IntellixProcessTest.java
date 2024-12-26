package com.axonivy.connector.intellix;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.axonivy.connector.intellix.connector.IntellixAuthFeature;
import com.axonivy.connector.intellix.demo.Data;
import com.docuware.dev._public.services.intellix.Field;

import ch.ivyteam.ivy.application.IApplication;
import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.rest.client.RestClient;
import ch.ivyteam.ivy.rest.client.RestClient.Builder;
import ch.ivyteam.ivy.rest.client.RestClientFeature;
import ch.ivyteam.ivy.rest.client.RestClients;
import ch.ivyteam.ivy.rest.client.security.CsrfHeaderFeature;

@IvyProcessTest(enableWebServer = true)
public class IntellixProcessTest {

  private static final BpmProcess testee = BpmProcess.path("intellixDemo");

  @Test
  public void canIdentifyFields(BpmClient bpmClient, IApplication app) {
    setupMockRestClient(app);
    bpmClient.mock().element(BpmElement.pid("1816266FC8F333CC-f13")).withNoAction();

    BpmElement startable = testee.elementName("uploadSampleInvoice.ivp");
    ExecutionResult result = bpmClient.start().process(startable).execute();
    Data data = (Data) result.data().last();
    List<Field> fields = data.getIndexed().getIndexData().getField();
    assertThat(fields).isNotEmpty();

    Field mailField = fields.get(7);
    assertThat(mailField.getName()).isEqualTo("Email");
    assertThat(mailField.getValue().get(0).getText()).isEqualTo("mail@alternate.de");
  }

  private static void setupMockRestClient(IApplication app) {
    RestClient restClient = RestClients.of(app).find("intellix");

    // change created client: use test url
    Builder builder = RestClient
      .create(restClient.name())
      .uuid(restClient.uniqueId())
      .uri("http://{ivy.engine.host}:{ivy.engine.http.port}/{ivy.request.application}/api/intellixMock")
      .description(restClient.description())
      .properties(restClient.properties());

    for (RestClientFeature feature : restClient.features()) {
      if (feature.clazz().contains(IntellixAuthFeature.class.getName())) {
        continue; // do not auth
      }
      builder.feature(feature.clazz());
    }
    builder.feature(CsrfHeaderFeature.class.getName()); // call backend

    restClient = builder.toRestClient();
    RestClients.of(app).set(restClient);
  }

}
