package org.unidal.web.user.login;

import org.unidal.web.user.UserPage;
import org.unidal.web.mvc.ViewModel;

public class Model extends ViewModel<UserPage, Action, Context> {
	public Model(Context ctx) {
		super(ctx);
	}

	@Override
	public Action getDefaultAction() {
		return Action.LOGIN;
	}
}
