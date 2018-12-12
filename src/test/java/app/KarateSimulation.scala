package app

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class KarateSimulation extends Simulation {

    val protocol = karateProtocol(
        "/" -> Nil
    )

    val scenario = scenario("create").exec(
        karateFeature("classpath:bench/flash-message.feature")
    )

    setUp(
        scenario.inject(rampUsers(10) over (5 seconds)).protocols(protocol)
    )

}
