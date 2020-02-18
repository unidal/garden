package org.unidal.orchid.diagram;

import org.unidal.web.mvc.ActionContext;

public class DefaultDiagramContext implements DiagramContext {
   private ActionContext<?> m_ctx;

   public DefaultDiagramContext(ActionContext<?> ctx) {
      m_ctx = ctx;
   }

   @Override
   public String getUser() {
      if (m_ctx != null) {
         return m_ctx.getAttribute("access.user");
      } else {
         return null;
      }
   }
}
