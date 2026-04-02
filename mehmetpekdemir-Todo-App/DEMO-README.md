# JDConf 2026 Demo — Todo App Modernization

This is a Todo app with a **Java/Spring Boot backend** and a **React frontend**, used to demonstrate end-to-end modernization with GitHub Copilot App Modernization.

| Component | Tech | Version (before modernization) |
|-----------|------|-------------------------------|
| Backend | Java / Spring Boot / Maven | Java 11, Spring Boot 2.2.6 |
| Frontend | React / Node.js | React 17, react-scripts 4.0.2 |
| Database | MySQL 8.0 | via Docker |

> **Ports used:** Backend **8085**, Frontend **3004**, MySQL **3306**. These were chosen to avoid conflicts when running multiple demo explorations simultaneously.

## Prerequisites

- **Docker Desktop** (for MySQL)
- **Java 17** (or the JDK you have installed)
- **Maven 3.9+**
- **Node.js 22+** and **npm 10+**

## Quick Start

### 1. Start MySQL via Docker

```bash
docker run --name todo-mysql \
  -e MYSQL_ROOT_PASSWORD= \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  -e MYSQL_DATABASE=todo_dev \
  -p 3306:3306 \
  -d mysql:8.0
```

Wait ~10 seconds for MySQL to initialize. Verify with:

```bash
docker exec todo-mysql mysql -u root -e "SELECT 1"
```

### 2. Build & Run the Backend

```bash
cd backend

# Set Java environment (adjust JAVA_HOME to your installation)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home"
export M2_HOME=${HOME}/Downloads/apache-maven-3.9.8
export PATH=${M2_HOME}/bin:${JAVA_HOME}/bin:${PATH}

# Build (skipping tests for speed)
mvn clean package -DskipTests

# Run
java -jar target/todo-app-0.0.1-SNAPSHOT.jar &
```

The backend starts on **http://localhost:8085**. Swagger UI is at **http://localhost:8085/swagger-ui.html**.

### 3. Install & Run the Frontend

```bash
cd frontend

npm install

# The --openssl-legacy-provider flag is needed for Node 22+ with old react-scripts
# PORT=3004 avoids conflicts with other demos
PORT=3004 NODE_OPTIONS=--openssl-legacy-provider npm start
```

The frontend starts on **http://localhost:3004**.

### 4. Use the App

1. Open **http://localhost:3004** in your browser
2. Click **Sign Up** to create an account
3. Log in with your new credentials
4. Create, update, and delete todos

## Build Fix Applied

The original repo targets Java 11. To build with Java 17, the Lombok version was bumped in `backend/pom.xml`:

```xml
<lombok.version>1.18.30</lombok.version>
```

This resolves the `IllegalAccessError` caused by older Lombok on Java 17+ (module system restrictions).

## Modernization Opportunities (Demo Talking Points)

### Backend (Java)
- **Java 11 → 21**: Multi-LTS upgrade
- **Spring Boot 2.2.6 → 3.x**: Jakarta EE namespace migration (`javax.*` → `jakarta.*`), Spring Security overhaul
- **Swagger**: springfox 2.9.2 → springdoc-openapi (springfox is abandoned)
- **JWT**: jjwt 0.9.1 → 0.12.x (major API changes)
- **Lombok**: 1.18.30 already applied, but worth noting

### Frontend (Node.js)
- **react-scripts 4.0.2** → 5.x (or migrate to Vite)
- **axios 0.21.1** → 1.x (known CVEs in 0.21.x)
- **bootstrap 4.6 → 5.x**, **reactstrap → react-bootstrap**
- **jwt-decode 3.1.2 → 4.x**
- **react-router-dom 5.2 → 6.x** (breaking API changes)
- Node 22 requires `--openssl-legacy-provider` workaround (goes away after upgrading react-scripts)

## Teardown

```bash
# Stop frontend (Ctrl+C in its terminal)

# Stop backend
kill $(lsof -ti:8085)

# Stop and remove MySQL container
docker stop todo-mysql && docker rm todo-mysql
```
