package com.dianping.garden.toolkit;

import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "t", defaultInboundAction = "query", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

com.dianping.garden.toolkit.page.query.Handler.class
})
public class ToolkitModule extends AbstractModule {

}
