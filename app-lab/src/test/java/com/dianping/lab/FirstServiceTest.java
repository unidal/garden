package com.dianping.lab;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

public class FirstServiceTest {
	@Test
	public void test() {
		new XmlBeanFactory(new ClassPathResource("/META-INF/spring/pigeon.xml"));

		String clientResourceName = FirstService.class.getName().replace('.', '/') + ".xml";
		BeanFactory clientFactory = new XmlBeanFactory(new ClassPathResource(clientResourceName));

		FirstService service = (FirstService) clientFactory.getBean("FirstService", FirstService.class);

		Assert.assertEquals("Hello, Lab!", service.hello("Lab"));
	}
}
