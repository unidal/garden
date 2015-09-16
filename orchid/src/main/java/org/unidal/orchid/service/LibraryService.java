package org.unidal.orchid.service;

import java.util.List;

import org.unidal.orchid.library.entity.Library;

public interface LibraryService {
	public String getXml();

	public List<Library> list();

	public void update(String xml) throws Exception ;
}
