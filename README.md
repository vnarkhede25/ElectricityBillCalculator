# Electricity Bill Calculator (Servlet + JSP)

Simple Maven-based Java webapp that calculates electricity bill using slab rates.

Prerequisites
- Java JDK 8 or newer installed and `JAVA_HOME` set.
- Maven 3.x installed.
- A servlet container (Tomcat 9+, Jetty) to deploy the WAR.

Build

Package the WAR:

```bash
mvn clean package
```

Artifact: `target/electricity-bill.war`.

Run Locally (embedded)

```powershell
cd D:\WT\Electricity_Bill
mvn -DskipTests package
mvn exec:java -Dexec.mainClass=com.example.embedded.EmbeddedServer
```

Open: http://localhost:8080/

Or run with Jetty plugin:

```powershell
cd D:\WT\Electricity_Bill
mvn org.eclipse.jetty:jetty-maven-plugin:9.4.50.v20221201:run
```

