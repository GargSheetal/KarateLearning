package Tests;

import com.intuit.karate.junit5.Karate;

public class TestRunnerJUnit5 {
	
	@Karate.Test
    Karate testSample() {
        return Karate.run("Delete").relativeTo(getClass());
    }

	@Karate.Test
	Karate testTags() {
		return Karate.run("Tags").tags("@regression").relativeTo(getClass());
	}
}
