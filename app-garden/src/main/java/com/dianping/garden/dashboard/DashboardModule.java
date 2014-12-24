package com.dianping.garden.dashboard;

import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "d", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.dashboard.page.home.Handler.class,

com.dianping.garden.dashboard.page.trend.Handler.class
})
public class DashboardModule extends AbstractModule {

}
