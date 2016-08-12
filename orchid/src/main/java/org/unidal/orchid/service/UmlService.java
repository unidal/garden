package org.unidal.orchid.service;

import java.io.IOException;

public interface UmlService {

	public byte[] generateImage(String uml, String type) throws IOException;

	public String getContextType(String uml, String type);

	public String getImageType(String type);

	public boolean updateUml(String product, String umlFile, String uml, StringBuilder message) throws IOException;
}