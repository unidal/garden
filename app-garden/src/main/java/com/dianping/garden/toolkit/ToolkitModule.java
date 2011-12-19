package com.dianping.garden.toolkit;

import com.site.web.mvc.AbstractModule;
import com.site.web.mvc.annotation.ModuleMeta;
import com.site.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "t", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.toolkit.page.home.Handler.class,

com.dianping.garden.toolkit.page.query.Handler.class,

})
public class ToolkitModule extends AbstractModule {

}
