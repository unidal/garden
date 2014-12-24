package com.dianping.garden.build;

import java.util.ArrayList;
import java.util.List;

import com.dianping.garden.wdbc.Html5WeeklyFetcher;
import com.dianping.garden.wdbc.JavascriptWeeklyFetcher;
import com.dianping.garden.wdbc.ProgrammerFetcher;
import com.dianping.garden.wdbc.WdbcMapping;
import org.unidal.lookup.configuration.Component;
import org.unidal.wdbc.WdbcEngine;
import org.unidal.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

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