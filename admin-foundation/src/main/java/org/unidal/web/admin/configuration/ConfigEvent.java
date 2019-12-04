package org.unidal.web.admin.configuration;

public class ConfigEvent {
	private String m_type;

	private String m_entity;

	private String m_key;

	public boolean isEligible(org.unidal.web.admin.configuration.EventType... types) {
		for (org.unidal.web.admin.configuration.EventType type : types) {
			if (type.getId().equals(m_type)) {
				return true;
			}
		}

		return false;
	}

	public boolean isEligible(org.unidal.web.admin.configuration.EventType type, String entity) {
		return type.getId().equals(m_type) && m_entity.equals(entity);
	}

	public boolean isEligible(org.unidal.web.admin.configuration.EventType type, String entity, String key) {
		return type.getId().equals(m_type) && m_entity.equals(entity) && m_key.equals(key);
	}
}
