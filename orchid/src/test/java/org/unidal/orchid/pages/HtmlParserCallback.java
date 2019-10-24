package org.unidal.orchid.pages;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Stack;

import javax.swing.text.MutableAttributeSet;
import javax.swing.text.html.HTML.Attribute;
import javax.swing.text.html.HTML.Tag;
import javax.swing.text.html.HTMLEditorKit;

import org.unidal.helper.Files;
import org.unidal.web.jsp.function.CodecFunction;

class HtmlParserCallback extends HTMLEditorKit.ParserCallback {
	private String m_page;

	private File m_base;

	private Stack<String> m_tags = new Stack<String>();

	private StringBuilder m_sb;

	private boolean m_eligible;

	private int m_skipped;

	private boolean m_inSimpleTag;

	private int m_preStart;

	private int m_codeStart;

	private int m_imgIndex;

	public HtmlParserCallback(String page, File base, int maxLength) {
		m_page = page;
		m_base = base;
		m_sb = new StringBuilder(maxLength);
	}

	public String getResult() {
		return m_sb.toString();
	}

	@Override
	public void handleEndTag(Tag tag, int pos) {
		String name = tag.toString();

		if (m_eligible) {
			if (m_skipped == 0) {
				boolean skip = false;

				if (name.equals("pre") && m_preStart > 0) {
					String pre = m_sb.substring(m_preStart);
					File file = new File(m_base, String.format("%s-%02d.uml", m_page, m_imgIndex));

					try {
						Files.forIO().writeTo(file, pre);
					} catch (IOException e) {
						System.err.println(e);
					}

					m_sb.setLength(m_preStart);
					m_sb.append(CodecFunction.htmlEncode(pre));
					m_preStart = 0;
				} else if (name.equals("code") && m_codeStart > 0) {
					String code = m_sb.substring(m_codeStart);

					if (code.length() > 0) {
						m_sb.setLength(m_codeStart);
						m_sb.append(CodecFunction.htmlEncode(code));
					} else {
						m_sb.setLength(m_sb.length() - 6);
						skip = true;
					}

					m_codeStart = 0;
				}

				if (!skip && !m_inSimpleTag) {
					m_sb.append("\r\n</").append(name).append('>');
				}
			}

			if (name.equals("div") && m_tags.size() == 3) {
				m_eligible = false;
			}
		}

		m_tags.pop();

		if (m_skipped > 0) {
			m_skipped--;
		}
	}

	@Override
	public void handleSimpleTag(Tag tag, MutableAttributeSet attributeSet, int pos) {
		m_inSimpleTag = true;
		handleStartTag(tag, attributeSet, pos);
		handleEndTag(tag, pos);
		m_inSimpleTag = false;
	}

	@Override
	public void handleStartTag(Tag tag, MutableAttributeSet attributeSet, int pos) {
		String name = tag.toString();

		m_tags.push(name);

		if (m_skipped > 0) {
			m_skipped++;
		}

		if (!m_eligible) {
			if (name.equals("div")) {
				Object id = attributeSet.getAttribute(Attribute.ID);

				if (m_tags.size() == 3 && "root".equals(id)) {
					m_eligible = true;
				}
			}
		}

		if (m_eligible && m_skipped == 0) {
			if (name.equals("script") || name.equals("ins") || name.equals("iframe") || name.equals("footer")
					|| name.equals("hr")) {
				m_skipped++;
			} else if (name.equals("div")) {
				Object id = attributeSet.getAttribute(Attribute.ID);
				Object klass = attributeSet.getAttribute(Attribute.CLASS);

				// skip AD banners
				if ("BC".equals(id)) {
					m_skipped++;
				} else if ("qsd".equals(klass)) {
					m_skipped++;
				}
			}

			if (m_skipped == 0) {
				m_sb.append("\r\n<").append(name);

				if (name.equals("img")) {
					Object link = attributeSet.getAttribute(Attribute.SRC);

					if (link != null && link.toString().startsWith("//s.plantuml.com/imgw")) {
						String src = String.format("/uml/help/%s/%s-%02d.uml", m_page, m_page, m_imgIndex);

						m_sb.append(" src=\"").append(src).append('"');
						m_imgIndex++;
					} else {
						// Bad image, ignore it
					}
				} else {
					Enumeration<?> keys = attributeSet.getAttributeNames();

					while (keys.hasMoreElements()) {
						Object key = keys.nextElement();
						Object value = attributeSet.getAttribute(key);

						m_sb.append(' ').append(key).append("=\"").append(value).append('"');
					}
				}

				m_sb.append('>');

				if ("pre".equals(name)) {
					m_preStart = m_sb.length();
				} else if ("code".equals(name)) {
					m_codeStart = m_sb.length();
				}
			}
		}
	}

	@Override
	public void handleText(char[] ch, int pos) {
		if (m_eligible && m_skipped == 0) {
			String text = new String(ch);

			// fix
			if (text.startsWith(".qsd{")) {
				return;
			}

			m_sb.append(text);
		}
	}
}
