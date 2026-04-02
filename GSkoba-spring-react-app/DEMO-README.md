# DEMO-README — GSkoba/spring-react-app (Todo List)

A **Java 8 + TypeScript React** todo-list app for the JDConf 2026 modernization demo.

| Layer | Tech (current / legacy) |
|-------|------------------------|
| Backend | Java 8, Spring Boot 2.2.6, Gradle 6.3, MongoDB (optional), **port 8082** |
| Frontend | React 16.13, TypeScript 3.7→4.0, react-scripts 3.4.1, **port 3002** |

---

## Prerequisites

| Tool | Version |
|------|---------|
| Java | 8, 11, or any JDK ≤ 14 (Gradle 6.3 limitation) |
| Node.js | 18+ (22 works with workaround below) |
| npm | 8+ |

> **Note:** Java 17+ will *not* work with the stock Gradle 6.3 wrapper — you would need to upgrade Gradle first.

---

## Quick Start (3 terminals)

### 1. Clone

```bash
git clone https://github.com/GSkoba/spring-react-app.git
cd spring-react-app
```

### 2. Configure for In-Memory Mode (no MongoDB needed)

Two small edits are required to run without a MongoDB instance:

**a) Switch to `dev` profile** — edit `src/main/resources/application.properties`:

```properties
spring.profiles.active=dev
```

(Remove or comment out the `spring.data.mongodb.uri` lines.)

**b) Exclude Mongo auto-configuration** — edit `src/main/java/com/nexign/springworkshop/NxSpringWorkshopApplication.java`:

```java
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.data.mongo.MongoRepositoriesAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;

@SpringBootApplication(exclude = {
    MongoAutoConfiguration.class,
    MongoDataAutoConfiguration.class,
    MongoRepositoriesAutoConfiguration.class
})
```

### 3. Build & Run the Backend (Terminal 1)

```bash
export JAVA_HOME="<path-to-jdk-11>"   # or JDK 8
./gradlew clean build
java -jar build/libs/nx-spring-workshop-0.1.0.jar
```

The backend starts on **http://localhost:8082** with 3 seed todos.

Verify:
```bash
curl http://localhost:8082/fetchAll
```

### 4. Install & Run the Frontend (Terminal 2)

```bash
cd frontend
npm install
```

If using **Node.js 17+**, you must set the OpenSSL legacy provider:

```bash
export NODE_OPTIONS=--openssl-legacy-provider
```

> **TypeScript fix:** The stock `typescript ~3.7.2` is too old for some transitive
> dependencies. If you see `import type` errors, run:
> ```bash
> npm install typescript@~4.0.0
> ```

Then start the dev server:

```bash
npm start
```

The frontend opens on **http://localhost:3002** (or next available port).

### 5. Use the App

Open **http://localhost:3002** in your browser. You should see a "Todo List" heading with three seed items (test1, test2, test3). Type a new todo and press Enter to add it; click **x** to delete.

---

## REST API Reference

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/fetchAll` | List all todos |
| POST | `/addTodo` | Create a todo (`{"title":"..."}`) |
| GET | `/delete?id=<id>` | Delete a todo by ID |
| GET | `/changeStatus?id=<id>` | Toggle todo done/undone |
| GET | `/actuator` | Spring Boot Actuator |

---

## Architecture (for the talk)

```
┌──────────────────┐        HTTP        ┌──────────────────────┐
│  React 16 + TS   │ ───────────────▶  │  Spring Boot 2.2.6   │
│  (port 3002)     │  localhost:8082    │  (port 8082)         │
│  react-scripts 3 │ ◀─────────────── │  Java 8 / Gradle 6.3 │
└──────────────────┘    JSON responses  │  In-memory DAO (dev) │
                                        └──────────────────────┘
```

### Modernization Targets (demo talking points)

**Backend:**
- Java 8 → 21 (modules, records, sealed classes, pattern matching, virtual threads)
- Spring Boot 2.2.6 → 3.x (Jakarta namespace, Spring Data API changes)
- Gradle 6.3 → 8.x (deprecated `compile` → `implementation`)

**Frontend:**
- TypeScript 3.7 → 5.x (`import type`, template literal types, `satisfies`)
- React 16 → 18 (new JSX transform, concurrent features)
- react-scripts 3 → 5 (Webpack 5, no OpenSSL workaround needed)
- All `@types/*` packages are extremely outdated

---

## Alternative: Run with MongoDB

If you prefer the `product` profile with a real database:

```bash
docker run --name mongo -p 27017:27017 -d mongo:7
```

Then in `application.properties`:
```properties
spring.profiles.active=product
spring.data.mongodb.uri=mongodb://localhost:27017/dev
```

And **remove** the `@SpringBootApplication(exclude = ...)` changes above.
