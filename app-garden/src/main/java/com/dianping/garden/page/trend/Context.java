package com.dianping.garden.page.trend;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dianping.garden.GardenContext;
import com.dianping.garden.view.UriBuilder;

public class Context extends GardenContext<Payload> {
   private SimpleDateFormat m_dateformat = new SimpleDateFormat("HH:mm:ss.SSS");

   public void redirect(Model model, Object path) {
      String uri = UriBuilder.uri(model, path);

      redirect(uri);
   }

   public void redirect(Model model, Object path, String qs) {
      String uri = UriBuilder.uri2(model, path, qs);

      redirect(uri);
   }

   public void log(String format, Object... args) {
      System.out.print("[" + m_dateformat.format(new Date()) + "] ");
      System.out.println(String.format(format, args));
   }
}