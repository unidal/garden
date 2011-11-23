package com.dianping.garden.biz.wdbc;

import java.io.IOException;
import java.net.URL;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.ebay.webres.helper.Files;
import com.ebay.webres.helper.Scanners.IDirectoryProvider;

public class ApacheDirectoryProvider implements IDirectoryProvider<URL> {
   private MessageFormat m_format = new MessageFormat("{2}<li><a href=\"{0}\">{3}</a></li>{1}");

   @Override
   public boolean isDirectory(URL base, String path) {
      return path.length() == 0 || path.endsWith("/");
   }

   @Override
   public List<String> list(URL base, String path) throws IOException {
      String content = Files.forIO().readFrom(new URL(base, path).openStream(), "utf-8");
      List<String> list = new ArrayList<String>();

      try {
         while (true) {
            Object[] items = m_format.parse(content);
            String shortName = (String) items[0];

            if (shortName.endsWith(".html")) {
               list.add(shortName);
            }

            content = (String) items[1];
         }
      } catch (Exception e) {
         // ignore it
      }

      // sort ASC in number
      Collections.sort(list, new Comparator<String>() {
         @Override
         public int compare(String o1, String o2) {
            int i1 = Integer.parseInt(o1.substring(0, o1.length() - ".html".length()));
            int i2 = Integer.parseInt(o2.substring(0, o2.length() - ".html".length()));

            return i1 - i2;
         }
      });

      return list;
   }
}