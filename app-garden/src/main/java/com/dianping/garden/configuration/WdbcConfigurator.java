package com.dianping.garden.configuration;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.wdbc.Html5WeeklyFetcher;
import com.dianping.garden.wdbc.JavascriptWeeklyFetcher;
import com.dianping.garden.wdbc.ProgrammerFetcher;
import com.dianping.garden.wdbc.WdbcMapping;
import com.site.lookup.configuration.Component;
import com.site.wdbc.WdbcEngine;
import com.site.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

final class WdbcConfigurator extends AbstractWdbcComponentsConfigurator {
   public List<Component> defineComponents() {
      List<Component> all = new ArrayList<Component>();

      all.add(C(WdbcMapping.class).req(WdbcEngine.class));

      all.addAll(new JavascriptWeeklyFetcher().defineComponents());
      all.addAll(new Html5WeeklyFetcher().defineComponents());
      all.addAll(new ProgrammerFetcher().defineComponents());

      return all;
   }
}