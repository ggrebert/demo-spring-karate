# Demo Karate

Demo project to test Rest API with [karate](https://github.com/intuit/karate)

## Build

* `H2` database

  ```bash
  mvn clean install
  ```

* `MySQL` database

  ```bash
  mvn clean install -Pmysql
  ```

* `PostgreSQL` database

  ```bash
  mvn clean install -Ppostgresql
  ```

__Reports :__

* [coverage](/target/site/jacoco/index.html)
* [timelaps](/target/surefire-reports/timeline.html)
* [cucumber report](/target/cucumber-html-reports/overview-features.html)

## Run

```bash
java -jar target/flash-message-dev.jar
```

__Urls :__

* [OpenAPI](http://127.0.0.1:8080/v2/api-docs)
* [Swagger](http://127.0.0.1:8080/swagger-ui.html)

## Benchmark

* `H2` database

  ```bash
  mvn -Dtest=KarateBench test
  ```

* `MySQL` database

  ```bash
  mvn -Dtest=KarateBench test -Pmysql
  ```

* `PostgreSQL` database

  ```bash
  mvn -Dtest=KarateBench test -Ppostgresql
  ```
