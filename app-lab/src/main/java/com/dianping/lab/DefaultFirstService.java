package com.dianping.lab;

public class DefaultFirstService implements FirstService {
	@Override
	public String hello(String name) {
		return "Hello, " + name + "!";
	}
}
