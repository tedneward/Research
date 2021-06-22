title=Apache Isis
tags=presentation, distribution, jvm, ui generation
summary=Provides apps with a standard, automatically generated UI.
~~~~~~

[Website](http://isis.apache.org/) | [Source](https://github.com/apache/isis.git)

---

Generally the preferred way to get started is with a starter template

"helloworld" starter app instructions:
```
curl https://codeload.github.com/apache/isis-app-helloworld/zip/2.0.0-M3 | jar xv
cd isis-app-helloworld-2.0.0-M3

mvn clean install
mvn spring-boot:run
```

"simpleapp" more structured start app instructions:
```
curl https://codeload.github.com/apache/isis-app-simpleapp/zip/2.0.0-M3 | jar xv
cd isis-app-simpleapp-2.0.0-M3

mvn clean install
mvn -pl webapp spring-boot:run
```

An example/demo app is available via Docker:
```
docker pull apacheisis/demo-springboot:latest
docker run \
        --name demo \
        --detach \
        -p8080:8080 \
        apacheisis/demo-springboot:latest
```
... and then accessible at http://localhost:8080/wicket/ ; login with "sven"/"pass".

---

See also: [Restful Objects](/distribution/restfulobjects.html)

---

## Documentation
[Setup Guide](http://isis.apache.org/setupguide/2.0.0-M3/about.html) [User Guide](http://isis.apache.org/userguide/2.0.0-M3/about.html) | [Reference Guide](http://isis.apache.org/refguide/2.0.0-M3/about.html) | [Testing](http://isis.apache.org/testing/2.0.0-M3/about.html)

