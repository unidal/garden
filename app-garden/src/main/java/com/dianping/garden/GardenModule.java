package com.dianping.garden;

import com.site.web.mvc.AbstractModule;
import com.site.web.mvc.annotation.ModuleMeta;
import com.site.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "g", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.page.home.Handler.class,

com.dianping.garden.page.trend.Handler.class,

com.dianping.garden.page.query.Handler.class,

})
public class GardenModule extends AbstractModule {

}
