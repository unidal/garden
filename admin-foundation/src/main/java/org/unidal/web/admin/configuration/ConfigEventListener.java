package org.unidal.web.admin.configuration;

public interface ConfigEventListener {
	public void onEvent(ConfigEvent event) throws ConfigException;
}
