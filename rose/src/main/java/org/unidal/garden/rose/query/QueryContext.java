package org.unidal.garden.rose.query;

import org.unidal.web.mvc.Action;
import org.unidal.web.mvc.ActionContext;
import org.unidal.web.mvc.ActionPayload;
import org.unidal.web.mvc.Page;

public class QueryContext<T extends ActionPayload<? extends Page, ? extends Action>> extends ActionContext<T> {

}
