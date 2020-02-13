package org.unidal.orchid;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.authorization.MyAccessControl;
import org.unidal.web.lifecycle.UrlMapping;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.Validator;

@Named(type = Validator.class, value = "page")
public class WebPageValidator<T extends ActionContext<?>> implements Validator<T> {
	@Inject
	private MyAccessControl m_accessControl;

	private Set<String> m_excludedActions = new HashSet<String>(Arrays.asList("view"));

	@Override
	public void validate(T ctx) throws Exception {
		UrlMapping mapping = ctx.getRequestContext().getUrlMapping();
		String module = mapping.getModule();
		String page = mapping.getAction();
		String path = mapping.getPathInfo();

		if ("user".equals(module)) {
			m_accessControl.forPage(ctx, module, page, path);
		} else if ("config".equals(module)) {
			m_accessControl.forPage(ctx, module, page, path);
		} else if ("uml".equals(module)) {
			String action = mapping.getRawAction();

			if (m_excludedActions.contains(action)) {
				// no access control
			} else {
				m_accessControl.forPage(ctx, module, page, path);
			}
		}
	}
}
