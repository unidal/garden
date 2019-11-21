package org.unidal.orchid.uml.edit;

import org.unidal.orchid.diagram.DefaultDiagramContext;
import org.unidal.orchid.diagram.DiagramContext;
import org.unidal.orchid.uml.UmlContext;

public class Context extends UmlContext<Payload> {
	private boolean m_error;

	private String m_message;

	private String m_diagram;

	private DiagramContext m_context = new DefaultDiagramContext();

	public DiagramContext getContext() {
		return m_context;
	}

	public String getDiagram() {
		return m_diagram;
	}

	public String getMessage() {
		return m_message;
	}

	public boolean isError() {
		return m_error;
	}

	public void setDiagram(String diagram) {
		m_diagram = diagram;
	}

	public void setError(boolean error) {
		m_error = error;
	}

	public void setMessage(String message) {
		m_message = message;
	}
}
