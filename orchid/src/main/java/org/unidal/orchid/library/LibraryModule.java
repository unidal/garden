package org.unidal.orchid.library;

import org.unidal.web.mvc.AbstractModule;
import org.unidal.web.mvc.annotation.ModuleMeta;
import org.unidal.web.mvc.annotation.ModulePagesMeta;

@ModuleMeta(name = "library", defaultInboundAction = "version", defaultTransition = "default", defaultErrorAction = "default")
@ModulePagesMeta({

org.unidal.orchid.library.version.Handler.class
})
public class LibraryModule extends AbstractModule {

}
