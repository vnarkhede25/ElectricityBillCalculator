# Electricity Bill Calculator (Servlet + JSP)

[![Java Version](https://img.shields.io/badge/Java-8%2B-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.x-blue.svg)](https://maven.apache.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**Electricity Bill Calculator** is a responsive web application developed using **Java Servlets**, **JSP (JavaServer Pages)**, **Bootstrap 5**, and **jQuery**. It calculates residential/commercial electricity bills accurately based on a multi-tiered (slab-wise) tariff rate system.

---

## 🚀 Features

- ⚡ **Slab-based Tariff Calculation**: Computes progressive billing amounts across multiple usage brackets.
- 📱 **Responsive Modern UI**: Styled with Bootstrap 5.3.0 and jQuery for mobile and desktop screens.
- 🛑 **Server-side & Client-side Validation**: Validates user inputs against negative values or invalid numbers with user-friendly error messages.
- 🛠️ **Dual Execution Modes**: Run directly via `jetty-maven-plugin` or through an standalone embedded Jetty server class (`EmbeddedServer.java`).
- 📦 **Standard WAR Deployment**: Can be packaged into a `.war` file and deployed to any Servlet 4.0 compliant container (Tomcat 9+, Jetty 9+).

---

## 📊 Tariff Slab Rates

The application calculates total bill amounts using the following standard slab structure:

| Consumption Tier | Slab Range | Rate per Unit (INR) |
| :--- | :--- | :--- |
| **Tier 1** | First 50 units (1 - 50) | **₹ 3.50 / unit** |
| **Tier 2** | Next 100 units (51 - 150) | **₹ 4.00 / unit** |
| **Tier 3** | Next 100 units (151 - 250) | **₹ 5.20 / unit** |
| **Tier 4** | Units above 250 (> 250) | **₹ 6.50 / unit** |

---

## 🛠️ Software Requirements & Dependency Versions

### System Requirements

| Tool / Runtime | Required Version | Tested Version |
| :--- | :--- | :--- |
| **JDK (Java Development Kit)** | Java 8 (1.8) or higher | Java 26 / JDK 17 |
| **Build Tool** | Apache Maven 3.6+ | Maven 3.9.16 |
| **Servlet Container** | Servlet 4.0 / JSP 2.3 specification | Jetty 9.4.50.v20221201 / Tomcat 9+ |

### Core Project Dependencies (`pom.xml`)

| Dependency / Library | Group ID / Source | Version | Scope |
| :--- | :--- | :--- | :--- |
| **Servlet API** | `javax.servlet:javax.servlet-api` | `4.0.1` | `provided` |
| **JSP API** | `javax.servlet.jsp:javax.servlet.jsp-api` | `2.3.3` | `provided` |
| **JSTL** | `javax.servlet:jstl` | `1.2` | `compile` |
| **Jetty Server** | `org.eclipse.jetty:jetty-server` | `9.4.50.v20221201` | `compile` |
| **Jetty WebApp** | `org.eclipse.jetty:jetty-webapp` | `9.4.50.v20221201` | `compile` |
| **Bootstrap** | CDN (`cdn.jsdelivr.net`) | `5.3.0` | Frontend CSS/JS |
| **jQuery** | CDN (`code.jquery.com`) | `3.6.0` | Frontend JS |

### Plugins

| Plugin | Artifact ID | Version | Description |
| :--- | :--- | :--- | :--- |
| **Maven Compiler Plugin** | `maven-compiler-plugin` | `3.8.1` | Compiles Java code with JDK 1.8 target |
| **Jetty Maven Plugin** | `jetty-maven-plugin` | `9.4.50.v20221201` | Runs webapp directly from Maven on port 8080 |
| **Exec Maven Plugin** | `exec-maven-plugin` | `3.1.0` | Executes standalone `EmbeddedServer` main class |

---

## 📂 Project Structure

```text
Electricity_Bill/
├── .gitignore                      # Git ignore rules (excludes target/ & IDE files)
├── pom.xml                         # Maven dependencies & build settings
├── README.md                       # Project documentation
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── example/
        │           ├── embedded/
        │           │   └── EmbeddedServer.java      # Programmatic Jetty server entry point
        │           └── servlet/
        │               └── BillCalculatorServlet.java # Main servlet processing form input & billing math
        └── webapp/
            ├── WEB-INF/
            │   └── web.xml         # Deployment descriptor (servlets & mapping)
            ├── index.jsp           # Main input form view with slab rate references
            └── result.jsp          # Billing breakdown summary view
```

---

## 💻 How to Run the Application

### 1. Run with Jetty Maven Plugin (Recommended for Development)

To quickly start the application server on port 8080:

```bash
mvn jetty:run
```

Or specify a custom port:

```bash
mvn -Djetty.port=8080 jetty:run
```

Access the app at: **`http://localhost:8080/`**

---

### 2. Run via Embedded Java Server

You can also run the application via the built-in standalone `EmbeddedServer`:

```bash
mvn clean compile
mvn exec:java -Dexec.mainClass="com.example.embedded.EmbeddedServer"
```

Access the app at: **`http://localhost:8080/`**

---

### 3. Build & Package WAR for External Servers (Tomcat / Jetty)

To create a deployable WAR package:

```bash
mvn clean package
```

The resulting WAR file will be created in the `target/` directory:
```text
target/electricity-bill-1.0.0.war
```

Deploy `electricity-bill-1.0.0.war` into the `webapps` folder of your Apache Tomcat or Jetty installation.

---

## 🔄 Application Workflow

1. User opens `http://localhost:8080/` (`index.jsp`).
2. User enters the total electricity units consumed (e.g. `275`) and clicks **Calculate**.
3. Form submits a `POST` request to `/calculate` mapped to [`BillCalculatorServlet`](file:///d:/WT/Electricity_Bill/src/main/java/com/example/servlet/BillCalculatorServlet.java).
4. `BillCalculatorServlet`:
   - Validates that the input is a positive number.
   - Computes the total bill using slab-wise rates.
   - Forwards the request attributes (`units`, `bill`) to [`result.jsp`](file:///d:/WT/Electricity_Bill/src/main/webapp/result.jsp).
5. `result.jsp` renders the calculated amount and provides options to calculate again.

---

## 📜 License

Distributed under the MIT License. Feel free to modify and use in academic or personal projects.
