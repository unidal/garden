package org.unidal.orchid.uml.view;

import org.unidal.orchid.diagram.DefaultDiagramContext;
import org.unidal.orchid.diagram.DiagramContext;
import org.unidal.orchid.uml.UmlContext;

public class Context extends UmlContext<Payload> {
	private DiagramContext m_context = new DefaultDiagramContext(this);

	public DiagramContext getContext() {
		return m_context;
	}
}
