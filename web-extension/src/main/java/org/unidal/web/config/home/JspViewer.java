package org.unidal.web.config.home;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.config.ConfigPage;
import org.unidal.web.mvc.view.BaseJspViewer;

@Named
public class JspViewer extends BaseJspViewer<ConfigPage, Action, Context, Model> {
   @Override
   protected String getJspFilePath(Context ctx, Model model) {
      return JspFile.VIEW.getPath();
   }
}
