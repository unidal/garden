package org.unidal.web.config;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.unidal.cat.Cat;
import org.unidal.dal.jdbc.DalException;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.lookup.extension.Initializable;
import org.unidal.lookup.extension.InitializationException;
import org.unidal.web.admin.dal.config.ConfigDao;
import org.unidal.web.admin.dal.config.ConfigDo;
import org.unidal.web.admin.dal.config.ConfigEntity;

@Named(type = ConfigService.class)
public class DefaultConfigService implements ConfigService, Initializable {
	@Inject
	private ConfigDao m_configDao;

	private ConcurrentMap<String, String> m_cached = new ConcurrentHashMap<String, String>();

	private List<ConfigEventListener> m_listeners = new ArrayList<ConfigEventListener>();

	private ConfigEventDispatcher m_dispatcher = new ConfigEventDispatcher();

	@Override
	public List<String> findCategories() throws ConfigException {
		List<String> categories = new ArrayList<String>();

		try {
			List<ConfigDo> configs = m_configDao.findAll(ConfigEntity.READSET_CATEGORY);

			for (ConfigDo config : configs) {
				String category = config.getCategory();

				if (!categories.contains(category)) {
					categories.add(category);
				}
			}
		} catch (DalException e) {
			Cat.logError(e);
		}

		Collections.sort(categories);
		return categories;
	}

	@Override
	public Config findConfig(String category, String name) throws ConfigException {
		try {
			ConfigDo config = m_configDao.findByCategoryAndName(category, name, ConfigEntity.READSET_FULL);

			return new Config(config);
		} catch (DalException e) {
			Cat.logError(e);
		}

		return null;
	}

	@Override
	public List<Config> findConfigs(String category) throws ConfigException {
		List<Config> configs = new ArrayList<Config>();

		try {
			List<ConfigDo> list = m_configDao.findAllByCategory(category, ConfigEntity.READSET_FULL);

			for (ConfigDo item : list) {
				configs.add(new Config(item));
			}
		} catch (DalException e) {
			throw new ConfigException("Error when updating configs to MySQL!" + e, e);
		}

		return configs;
	}

	@Override
	public boolean getBoolean(String category, String name, boolean defaultValue) {
		String value = getString(category, name, null);

		if (value == null) {
			return defaultValue;
		} else {
			return Boolean.parseBoolean(value);
		}
	}

	public String getString(String category, String name, String defaultValue) {
		String key = category + ":" + name;
		String value = m_cached.get(key);

		if (value == null) {
			try {
				ConfigDo config = m_configDao.findByCategoryAndName(category, name, ConfigEntity.READSET_FULL);

				value = toString(config.getDetails());
				m_cached.put(key, value);
			} catch (DalException e) {
				// ignore it
				Cat.logError(e);
			}
		}

		if (value != null) {
			return value;
		} else {
			return defaultValue;
		}
	}

	@Override
	public void initialize() throws InitializationException {
		m_listeners.add(new RemoteCacheRefreshListener());
	}

	public void register(ConfigEventListener listener) {
		if (!m_listeners.contains(listener)) {
			m_listeners.add(listener);
		}
	}

	private byte[] toBytes(String str) {
		try {
			return str.getBytes("utf-8");
		} catch (UnsupportedEncodingException e) {
			return str.getBytes();
		}
	}

	private String toString(byte[] bytes) {
		try {
			return new String(bytes, "utf-8");
		} catch (UnsupportedEncodingException e) {
			return new String(bytes);
		}
	}

	@Override
	public void updateConfig(String category, String name, String description, String value) throws ConfigException {
		ConfigDo c = new ConfigDo();

		c.setCategory(category);
		c.setName(name);
		c.setDescription(description);
		c.setDetails(toBytes(value));
		c.setStatus(1);

		try {
			m_configDao.upsert(c); // update or insert

			String key = category + ":" + name;
			ConfigEvent event = new ConfigEvent(new Config(c));

			m_cached.put(key, value);
			m_dispatcher.dispatch(event);
		} catch (DalException e) {
			throw new ConfigException("Error when updating config to MySQL!" + e, e);
		}
	}

	private class ConfigEventDispatcher {
		public void dispatch(ConfigEvent event) {
			List<ConfigEventListener> listeners = new ArrayList<ConfigEventListener>(m_listeners);

			// make sure put it in the last since it takes time to complete
			listeners.add(new RemoteCacheRefreshListener());

			for (ConfigEventListener listener : m_listeners) {
				try {
					listener.onEvent(event);
				} catch (Exception e) {
					Cat.logError(e);
				}
			}
		}
	}

	private class RemoteCacheRefreshListener implements ConfigEventListener {
		@Override
		public void onEvent(ConfigEvent event) {
			
		}
	}
}
