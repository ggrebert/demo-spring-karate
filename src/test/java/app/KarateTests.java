package app;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

@CucumberOptions(features = "classpath:features")
@SpringBootTest(classes = Application.class, webEnvironment = SpringBootTest.WebEnvironment.DEFINED_PORT)
@RunWith(SpringRunner.class)
public class KarateTests {

	@Test
    public void testParallel() {
		System.setProperty("karate.env", "ci");

        Results results = Runner.parallel(getClass(), 1, "target/surefire-reports");
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);

		List<String> jsonPaths = new ArrayList(jsonFiles.size());

		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config = new Configuration(new File("target"), "ci");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);

        reportBuilder.generateReports();
	}

}
