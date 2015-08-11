package org.unidal.orchid.service;

import java.util.List;

public interface StorageService {
	public boolean createUmlFile(String umlFile);

	public List<String> getUmlFiles();

	public String getUmlContent(String umlFile);

	public void saveUmlFile(String umlFile, String uml) throws Exception;

}
