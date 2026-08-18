# Electricity Bill Calculator (Servlet + JSP)

ElectricityBillCalculator is a responsive web application developed using Java Servlet, JSP, Bootstrap, and jQuery to calculate electricity bills based on slab-wise tariff rates. The app accepts the number of units consumed, computes the bill using predefined slab rates, and displays the total amount.

Prerequisites
- Java JDK 8 or newer installed and `JAVA_HOME` set.
- Maven 3.x installed.
- A servlet container (Tomcat 9+, Jetty) to deploy the WAR.

Build

Package the WAR:

```bash
mvn clean package
```

Artifact: `target/electricity-bill-1.0.0.war`.

Run Locally (embedded)

```powershell
cd D:\WT\Electricity_Bill
mvn -DskipTests package
mvn exec:java -Dexec.mainClass=com.example.embedded.EmbeddedServer
```

Open: http://localhost:8080/

Or run with Jetty plugin (quick dev run):

```powershell
cd D:\WT\Electricity_Bill
mvn -Djetty.port=8080 jetty:run
```

Notes
- The UI is responsive using Bootstrap; JSTL is included for JSP tag support.
- You may see warnings about duplicate JSTL classes when running with Jetty; they are harmless for this demo but can be cleaned by adjusting `pom.xml` dependencies.

License: MIT-style (edit as needed)
