package com.axonivy.connector.intellix;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import jakarta.annotation.security.PermitAll;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import org.apache.commons.io.IOUtils;

import io.swagger.v3.oas.annotations.Hidden;

@Path("intellixMock")
@PermitAll
@Hidden
public class IntellixServiceMock {

  @POST
  @Produces(MediaType.APPLICATION_XML)
  @Consumes(MediaType.MULTIPART_FORM_DATA)
  @Path("documents")
  public Response documents(@QueryParam(value = "extract") boolean extract) {
    System.out.println(extract); // read
    return Response.ok(load("xml/document.xml")).type(MediaType.APPLICATION_XML).build();
  }

  private static String load(String path) {
    try (InputStream is = IntellixServiceMock.class.getResourceAsStream(path)) {
      return IOUtils.toString(is, StandardCharsets.UTF_8);
    } catch (IOException ex) {
      throw new RuntimeException("Failed to read resource: " + path);
    }
  }
}
