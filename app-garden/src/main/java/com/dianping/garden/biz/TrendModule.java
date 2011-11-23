package com.dianping.garden.biz;

import com.site.web.mvc.AbstractModule;
import com.site.web.mvc.annotation.ModuleMeta;
import com.site.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "g", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.biz.home.Handler.class,

com.dianping.garden.biz.trend.Handler.class,

})
public class TrendModule extends AbstractModule {

}
