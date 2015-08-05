package org.unidal.orchid.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import net.sourceforge.plantuml.BlockUml;
import net.sourceforge.plantuml.FileFormat;
import net.sourceforge.plantuml.FileFormatOption;
import net.sourceforge.plantuml.PSystemError;
import net.sourceforge.plantuml.SourceStringReader;

import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;

@Named(type = UmlService.class)
public class DefaultUmlService implements UmlService {
	@Inject
	private StorageService m_storage;

	@Override
	public byte[] generateImage(String uml, String type) throws IOException {
		if (!uml.trim().startsWith("@startuml")) {
			uml = "@startuml\n" + uml;
		}

		if (!uml.trim().endsWith("@enduml")) {
			uml = uml + "\n@enduml";
		}

		SourceStringReader reader = new SourceStringReader(uml);
		ByteArrayOutputStream baos = new ByteArrayOutputStream(8192);
		FileFormat format = FileFormat.PNG;

		for (FileFormat e : FileFormat.values()) {
			if (e.name().equalsIgnoreCase(type)) {
				format = e;
				break;
			}
		}

		reader.generateImage(baos, new FileFormatOption(format));

		if (!hasError(reader.getBlocks())) {
			return baos.toByteArray();
		} else {
			return null;
		}
	}

	@Override
	public String getContextType(String type) {
		if (type == null || "png".equals(type)) {
			return "image/png";
		} else if ("text".equals(type)) {
			return "text/plain; charset=utf-8";
		} else if ("svg".equals(type)) {
			return "image/svg+xml; charset=utf-8";
		} else {
			return "image/" + type;
		}
	}

	@Override
	public String getImageType(String type) {
		if (type == null) {
			return "png";
		} else if ("text".equals(type)) {
			return "svg";
		} else {
			return type;
		}
	}

	private boolean hasError(List<BlockUml> blocks) throws IOException {
		for (BlockUml b : blocks) {
			if (b.getDiagram() instanceof PSystemError) {
				return true;
			}
		}

		return false;
	}

	private boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	@Override
	public boolean updateUml(String umlFile, String uml, StringBuilder message) throws IOException {
		if (!isEmpty(umlFile) && !isEmpty(uml)) {
			byte[] image = generateImage(uml, null);

			try {
				if (image != null) {
					m_storage.save(umlFile, uml);

					message.append("Update file(" + umlFile + ") successfully!");
					return true;
				} else {
					message.append("UML is invalid, can't update file(" + umlFile + ")!");
				}
			} catch (IOException e) {
				message.append("Failed to update file(" + umlFile + ")!");
			}
		}

		return false;
	}
}
