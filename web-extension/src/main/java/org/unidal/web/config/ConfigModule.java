package org.unidal.web.config;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.Module;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "config", defaultInboundAction = "home", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.web.config.home.Handler.class,

org.unidal.web.config.refresh.Handler.class,

})
@Named(type = Module.class, value = "org.unidal.web.config.ConfigModule")
public class ConfigModule extends AbstractModule {

}
