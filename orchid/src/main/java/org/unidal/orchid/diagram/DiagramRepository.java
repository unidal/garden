package org.unidal.orchid.diagram;

import java.util.List;

import org.unidal.orchid.diagram.entity.DiagramModel;

public interface DiagramRepository {
	public List<DiagramModel> getDiagrams() throws Exception;

	public void setup(String product, Properties properties);

	public void updateDiagram(DiagramModel diagram) throws Exception;

	public static interface Properties {
		public String getStringProperty(String name, String defaultValue);

		public long getLongProperty(String name, long defaultValue);

		public long getIntProperty(String name, int defaultValue);

		public boolean getBooleanProperty(String name, boolean defaultValue);
	}
}
