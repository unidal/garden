package org.unidal.web;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.unidal.web.security.AuthServiceTest;

@RunWith(Suite.class)
@SuiteClasses({

      AuthServiceTest.class,

})
public class AllTests {

}
