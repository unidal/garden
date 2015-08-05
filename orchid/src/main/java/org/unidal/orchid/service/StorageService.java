package org.unidal.orchid.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

public interface StorageService {
	public List<File> getUmlFiles();

	public String getUmlContent(String umlFile);

	public void save(String umlFile, String uml) throws IOException;

	public boolean tryCreateFile(String umlFile);
}
