package org.unidal.web.user.login;

import static org.unidal.web.config.ConfigService.CATEGORY_SECURITY;

import java.io.IOException;

import javax.servlet.ServletException;

import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.annotation.Named;
import org.unidal.web.config.ConfigService;
import org.unidal.web.mvc.PageHandler;
import org.unidal.web.mvc.annotation.InboundActionMeta;
import org.unidal.web.mvc.annotation.OutboundActionMeta;
import org.unidal.web.mvc.annotation.PayloadMeta;
import org.unidal.web.security.AuthService;
import org.unidal.web.security.DefaultAuthContext;
import org.unidal.web.user.UserPage;

@Named
public class Handler implements PageHandler<Context> {
   @Inject
   private JspViewer m_jspViewer;

   @Inject
   private AuthService m_authService;

   @Inject
   private ConfigService m_configService;

   @Override
   @PayloadMeta(Payload.class)
   @InboundActionMeta(name = "login")
   public void handleInbound(Context ctx) throws ServletException, IOException {
      Payload payload = ctx.getPayload();
      Action action = payload.getAction();
      String cypherKey = m_configService.getString(CATEGORY_SECURITY, "cipher.key", "");
      DefaultAuthContext ac = new DefaultAuthContext(ctx, cypherKey);

      if (action.isLogout()) {
         m_authService.logout(ac);
      } else if (payload.isSubmit()) {
         if (m_authService.login(ac)) {
            ctx.redirect(ac.buildReturnUrl());
            ctx.stopProcess();
         }
      }

      // skip actual action, show sign-in form
      ctx.skipAction();
   }

   @Override
   @OutboundActionMeta(name = "login")
   public void handleOutbound(Context ctx) throws ServletException, IOException {
      Model model = new Model(ctx);

      model.setAction(Action.LOGIN);
      model.setPage(UserPage.LOGIN);

      if (!ctx.isProcessStopped()) {
         m_jspViewer.view(ctx, model);
      }
   }
}
