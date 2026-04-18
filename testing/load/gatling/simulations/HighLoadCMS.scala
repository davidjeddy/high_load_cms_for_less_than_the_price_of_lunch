
import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class HighLoadCMS extends Simulation {

	val target = System.getProperty("target")

	val httpProtocol = http
		.baseUrl("http://" + target)
		.inferHtmlResources()
		.acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
		.acceptEncodingHeader("gzip, deflate")
		.acceptLanguageHeader("en-US,en;q=0.5")
		.doNotTrackHeader("1")
		.userAgentHeader("Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0")

	val headers_0 = Map(
		"Pragma" -> "no-cache",
		"Upgrade-Insecure-Requests" -> "1")

	val headers_1 = Map(
		"Accept" -> "*/*",
		"Pragma" -> "no-cache")

	val headers_2 = Map("Pragma" -> "no-cache")

    val uri2 = "https://fonts.googleapis.com/css"

	val scn = scenario("HighLoadCMS")
		.exec(http("request_0")
			.get("/")
			.headers(headers_0)
			.resources(http("request_1")
			.get("/wp-includes/js/wp-emoji-release.min.js?ver=4.9.8")
			.headers(headers_1),
            http("request_2")
			.get("/favicon.ico")
			.headers(headers_2)
			.check(status.is(404))))

	setUp(
		scn.inject(
    		rampConcurrentUsers(0) to (500) during (60 seconds)
		).protocols(httpProtocol)
	)
}