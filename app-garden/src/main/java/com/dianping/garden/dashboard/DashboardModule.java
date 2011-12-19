package com.dianping.garden.dashboard;

import com.site.web.mvc.AbstractModule;
import com.site.web.mvc.annotation.ModuleMeta;
import com.site.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "d", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.dashboard.page.home.Handler.class,

com.dianping.garden.dashboard.page.trend.Handler.class,

})
public class DashboardModule extends AbstractModule {

}
