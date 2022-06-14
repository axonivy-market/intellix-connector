package com.axonivy.connector.intellix;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import org.eclipse.core.resources.IFile;
import org.eclipse.core.resources.IProject;
import org.eclipse.core.runtime.CoreException;

import ch.ivyteam.ivy.IvyConstants;
import ch.ivyteam.ivy.environment.Ivy;

@SuppressWarnings("restriction")
public class FileLoaderUtil {

  public static File loadFromWebContent(String relativePath) throws IOException, CoreException {
    IProject project = Ivy.request().getProcessModelVersion().getProject();
    IFile file = project.getFolder(IvyConstants.DIRECTORY_WEB_CONTENT).getFile(relativePath);
    java.nio.file.Path path = Files.createTempFile("rechnung", ".pdf");
    Files.copy(file.getContents(), path, StandardCopyOption.REPLACE_EXISTING);
    return path.toFile();
  }

}
