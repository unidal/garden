package org.unidal.orchid;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.unidal.orchid.diagram.DiagramManagerTest;
import org.unidal.orchid.diagram.DiagramServiceTest;

@RunWith(Suite.class)
@SuiteClasses({

		DiagramManagerTest.class,

		DiagramServiceTest.class,

})
public class AllTests {

}
