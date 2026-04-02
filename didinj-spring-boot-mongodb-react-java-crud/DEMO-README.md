# JDConf 2026 Demo — Spring Boot + MongoDB + React CRUD

> **Repository:** [didinj/spring-boot-mongodb-react-java-crud](https://github.com/didinj/spring-boot-mongodb-react-java-crud)

A 2018-era contacts CRUD app: **Java 8 / Spring Boot 2.0 / Gradle** backend with a **React 16 / react-scripts 1.x** frontend. The React app is built into `src/main/resources/static` so Spring Boot serves everything on a single port.

---

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Java | **8** (Temurin) | `sourceCompatibility = 1.8` in `build.gradle` |
| Node.js | **≥ 14** (tested with 22) | For rebuilding the frontend |
| Docker | Any recent | For running MongoDB |

---

## Quick Start (3 steps)

### 1. Start MongoDB

```bash
docker run --name mongo-didinj -p 27017:27017 -d mongo:7
```

> **Port conflict?** Pick a different host port (e.g. `-p 27020:27017`) and update `src/main/resources/application.properties` to match:
> ```properties
> spring.data.mongodb.port=27020
> ```

### 2. Build & Run the Backend

```bash
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"
export PATH="${JAVA_HOME}/bin:${PATH}"

./gradlew bootRun
```

Spring Boot starts on **http://localhost:8080** by default.

> **Port conflict?** Add to `src/main/resources/application.properties`:
> ```properties
> server.port=8086
> ```

### 3. Open in Browser

Navigate to **http://localhost:8080** (or your chosen port). The pre-built React frontend loads automatically.

You can:
- View the contacts list (initially empty)
- Click **Create** to add a contact (name, address, city, phone, email)
- Click a contact to view details
- Edit or delete contacts

---

## (Optional) Rebuild the Frontend from Source

If you want to rebuild the React app (e.g., after making frontend changes):

```bash
cd frontend
npm install
npm run build        # builds and copies output to ../src/main/resources/static
```

Then restart the backend (`./gradlew bootRun`).

---

## API Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/contacts` | List all contacts |
| POST | `/contacts` | Create a contact |
| GET | `/contacts/{id}` | Get one contact |
| PUT | `/contacts/{id}` | Update a contact |
| DELETE | `/contacts/{id}` | Delete a contact |

### Quick API test

```bash
# Create a contact
curl -X POST http://localhost:8080/contacts \
  -H "Content-Type: application/json" \
  -d '{"name":"Jane Doe","address":"456 Oak Ave","city":"Portland","phone":"555-9876","email":"jane@example.com"}'

# List all contacts
curl http://localhost:8080/contacts
```

---

## The "Before" State (Modernization Talking Points)

| Layer | Current | Target |
|-------|---------|--------|
| **Java** | 8 (`1.8`) | 21 |
| **Spring Boot** | 2.0.0.RELEASE | 3.x (Jakarta EE namespace) |
| **Gradle** | 4.5.1 (uses deprecated `compile`) | 8.x (`implementation`) |
| **React** | 16.2 | 18+ (hooks, concurrent mode) |
| **react-scripts** | 1.1.1 | 5.x (Webpack 5) |
| **axios** | 0.18.0 | 1.x (breaking error-handling changes) |
| **Vulnerabilities** | 231 npm audit findings | 0 |

### Known Bugs in the Original Code
- `Edit.js` sends `postalCode` instead of `email` — the backend `Contact` model has no `postalCode` field.
- JSX uses `class` instead of `className` in several components.

---

## Cleanup

```bash
# Stop MongoDB
docker stop mongo-didinj && docker rm mongo-didinj
```
