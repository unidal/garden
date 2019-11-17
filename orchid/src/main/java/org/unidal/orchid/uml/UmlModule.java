package org.unidal.orchid.uml;

import org.unidal.lookup.annotation.Named;
import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.Module;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "uml", defaultInboundAction = "edit", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.orchid.uml.edit.Handler.class,

org.unidal.orchid.uml.help.Handler.class,

org.unidal.orchid.uml.upload.Handler.class,

org.unidal.orchid.uml.view.Handler.class,

})
@Named(type = Module.class, value = "org.unidal.orchid.uml.UmlModule")
public class UmlModule extends AbstractModule {

}
