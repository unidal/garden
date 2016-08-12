package org.unidal.orchid.uml;

import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "uml", defaultInboundAction = "edit", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.orchid.uml.edit.Handler.class,

org.unidal.orchid.uml.help.Handler.class,

org.unidal.orchid.uml.upload.Handler.class
})
public class UmlModule extends AbstractModule {

}
