package org.unidal.orchid.uml.edit;

import org.unidal.orchid.uml.UmlContext;

public class Context extends UmlContext<Payload> {
	private boolean m_error;

	private String m_message;

	private String m_umlFile;

	public String getMessage() {
		return m_message;
	}

	public String getUmlFile() {
		return m_umlFile;
	}

	public boolean isError() {
		return m_error;
	}

	public void setError(boolean error) {
		m_error = error;
	}

	public void setMessage(String message) {
		m_message = message;
	}

	public void setUmlFile(String umlFile) {
		m_umlFile = umlFile;
	}
}
