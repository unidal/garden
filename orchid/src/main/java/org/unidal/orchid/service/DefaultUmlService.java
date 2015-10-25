package org.unidal.orchid.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.List;

import net.sourceforge.plantuml.BlockUml;
import net.sourceforge.plantuml.FileFormat;
import net.sourceforge.plantuml.FileFormatOption;
import net.sourceforge.plantuml.PSystemError;
import net.sourceforge.plantuml.SourceStringReader;

import org.codehaus.plexus.util.Base64;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;

@Named(type = UmlService.class)
public class DefaultUmlService implements UmlService {
	@Inject
	private StorageService m_storage;

	@Override
	public byte[] generateImage(String uml, String type) throws IOException {
		if (!uml.trim().startsWith("@start")) {
			uml = "@startuml\n" + uml;
		}

		if (!uml.trim().endsWith("@end")) {
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
			if (uml.trim().startsWith("@startditaa")) {
				ByteBuffer bb = ByteBuffer.allocate(baos.size() * 4 / 3 + 32);

				bb.put("data:image/png;base64,".getBytes());
				bb.put(Base64.encodeBase64(baos.toByteArray()));
				return bb.array();
			} else {
				return baos.toByteArray();
			}
		} else {
			return null;
		}
	}

	@Override
	public String getContextType(String uml, String type) {
		if (type == null || "png".equals(type)) {
			return "image/png";
		} else if ("text".equals(type)) {
			if (uml.startsWith("@startditaa")) {
				return "image/png";
			} else {
				return "text/plain; charset=utf-8";
			}
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
					m_storage.saveUmlFile(umlFile, uml);

					message.append("Update file(" + umlFile + ") successfully!");
					return true;
				} else {
					message.append("UML is invalid, can't update file(" + umlFile + ")!");
				}
			} catch (Exception e) {
				message.append("Failed to update file(" + umlFile + ")!");
			}
		}

		return false;
	}
}
