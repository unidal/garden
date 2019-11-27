package org.unidal.orchid.diagram;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.unidal.lookup.annotation.Named;

import net.sourceforge.plantuml.BlockUml;
import net.sourceforge.plantuml.FileFormat;
import net.sourceforge.plantuml.FileFormatOption;
import net.sourceforge.plantuml.SourceStringReader;
import net.sourceforge.plantuml.error.PSystemError;

@Named(type = DiagramGenerator.class)
public class DefaultDiagramGenerator implements DiagramGenerator {
	@Override
	public void generate(HttpServletResponse res, String content, String type) throws IOException {
		String uml = normalize(content);
		byte[] image = generate(uml, type);

		if (image != null) {
			res.setContentType(getContextType(uml, type));
			res.setContentLength(image.length);
			res.getOutputStream().write(image);
		} else {
			res.sendError(400, "UML is incompleted!");
		}
	}

	@Override
	public byte[] generate(String content, String type) throws IOException {
		String uml = normalize(content);
		FileFormat format = getFileFormat(type);
		SourceStringReader reader = new SourceStringReader(uml);
		ByteArrayOutputStream baos = new ByteArrayOutputStream(8192);
		
		reader.outputImage(baos, new FileFormatOption(format));

		if (!hasError(reader.getBlocks())) {
			byte[] b = baos.toByteArray();

			if (format == FileFormat.PNG) {
				return b;
			} else if (content.startsWith("@startditaa") || b.length > 0 && (b[0] & 0x80) != 0) {
				ByteBuffer bb = ByteBuffer.allocate(baos.size() * 4 / 3 + 32);

				bb.put("data:image/png;base64,".getBytes());
				bb.put(Base64.getEncoder().encode(b));

				byte[] ba = new byte[bb.position()];

				bb.position(0);
				bb.get(ba);

				return ba;
			} else {
				return baos.toByteArray();
			}
		}

		return null;
	}

	private String getContextType(String uml, String type) {
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

	private FileFormat getFileFormat(String type) {
		FileFormat format = FileFormat.PNG;

		for (FileFormat e : FileFormat.values()) {
			if (e.name().equalsIgnoreCase(type)) {
				format = e;
				break;
			}
		}

		return format;
	}

	private boolean hasError(List<BlockUml> blocks) throws IOException {
		for (BlockUml b : blocks) {
			if (b.getDiagram() instanceof PSystemError) {
				return true;
			}
		}

		return false;
	}

	private String normalize(String content) {
		content = content.trim();

		if (!content.startsWith("@start")) {
			content = "@startuml\n" + content;
		}

		if (!content.endsWith("@end")) {
			content = content + "\n@enduml";
		}

		return content;
	}
}
