package com.dianping.garden;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.dianping.garden.wdbc.ApacheDirectoryProviderTest;
import com.dianping.garden.wdbc.Html5WeeklyTest;
import com.dianping.garden.wdbc.JavascriptWeeklyTest;
import com.dianping.garden.wdbc.ProgrammerTest;

@RunWith(Suite.class)
@SuiteClasses({

/* .wdbc */
ApacheDirectoryProviderTest.class,

Html5WeeklyTest.class,

JavascriptWeeklyTest.class,

ProgrammerTest.class,

})
public class AllTests {

}
