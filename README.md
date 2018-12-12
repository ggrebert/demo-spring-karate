# Demo Karate

Demo project to test Rest API with [karate](https://github.com/intuit/karate)

## Build

```bash
mvn clean install
```

__Reports :__

* [coverage](/target/site/jacoco/index.html)
* [timelaps](/target/surefire-reports/timeline.html)
* [cucumber report](/target/cucumber-html-reports/overview-features.html)

## Run

```bash
java -jar target/flash-message-dev.jar
```

__Urls __:

* [OpenAPI](http://127.0.0.1:8080/v2/api-docs)
* [Swagger](http://127.0.0.1:8080/swagger-ui.html)

## Benchmark

```bash
mvn -Dtest=KarateBench test
```
