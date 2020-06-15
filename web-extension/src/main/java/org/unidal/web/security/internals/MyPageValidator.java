package org.unidal.web.security.internals;

import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.lifecycle.UrlMapping;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.Validator;

@Named(type = Validator.class, value = "my")
public class MyPageValidator<T extends ActionContext<?>> implements Validator<T> {
   @Inject
   private MyAccessControl m_accessControl;

   @Override
   public void validate(T ctx) throws Exception {
      UrlMapping mapping = ctx.getRequestContext().getUrlMapping();
      String module = mapping.getModule();
      String page = mapping.getAction();
      String path = mapping.getPathInfo();

      if ("user".equals(module)) {
         if (!"login".equals(page)) {
            m_accessControl.forPage(ctx, module, page, path);
         }
      } else if ("config".equals(module)) {
         if (!"refresh".equals(page)) {
            m_accessControl.forPage(ctx, module, page, path);
         }
      }
   }
}
