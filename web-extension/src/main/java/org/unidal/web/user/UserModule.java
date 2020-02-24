package org.unidal.web.user;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.Module;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "user", defaultInboundAction = "login", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.web.user.login.Handler.class,

})
@Named(type = Module.class, value = "org.unidal.web.user.UserModule")
public class UserModule extends AbstractModule {

}
