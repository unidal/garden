package com.dianping.garden;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.dianping.garden.biz.wdbc.ApacheDirectoryProviderTest;
import com.dianping.garden.biz.wdbc.Html5WeeklyTest;
import com.dianping.garden.biz.wdbc.JavascriptWeeklyTest;
import com.dianping.garden.biz.wdbc.ProgrammerTest;

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
