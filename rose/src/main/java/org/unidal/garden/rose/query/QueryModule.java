package org.unidal.garden.rose.query;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.Module;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "query", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.garden.rose.query.home.Handler.class,

})
@Named(type = Module.class, value = "org.unidal.garden.rose.query.QueryModule")
public class QueryModule extends AbstractModule {

}
