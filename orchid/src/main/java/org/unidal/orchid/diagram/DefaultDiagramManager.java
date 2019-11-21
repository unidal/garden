package org.unidal.orchid.diagram;

import java.io.InputStream;

import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.orchid.diagram.entity.RootModel;
import org.unidal.orchid.diagram.transform.DefaultSaxParser;

@Named(type = DiagramManager.class)
public class DefaultDiagramManager implements DiagramManager, Initializable {
	private RootModel m_model;

	@Override
	public RootModel getModel() {
		return m_model;
	}

	@Override
	public void initialize() throws InitializationException {
		InputStream in = getClass().getResourceAsStream("diagram.xml");

		try {
			m_model = DefaultSaxParser.parse(in);
		} catch (Exception e) {
			throw new InitializationException("Error when loading diagram.xml!", e);
		}
	}
}
