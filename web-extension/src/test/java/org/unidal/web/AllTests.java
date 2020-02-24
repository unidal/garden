package org.unidal.web;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.unidal.web.security.auth.TulipRealmTest;

@RunWith(Suite.class)
@SuiteClasses({

      TulipRealmTest.class,

})
public class AllTests {

}
