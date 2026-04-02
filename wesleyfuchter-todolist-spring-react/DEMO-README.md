# Demo: wesleyfuchter/todolist-spring-react

A simple TODO list app with a **React** frontend and **Spring Boot** backend — ideal for demonstrating end-to-end modernization of a legacy Java + Node.js application.

| Layer    | Technology Stack (Current → Upgrade Target) |
|----------|---------------------------------------------|
| Backend  | Java 11, Spring Boot 2.5.5, Maven, Flyway, PostgreSQL |
| Frontend | React 17, react-scripts 4.0.3, Material UI 4, react-router-dom 5 |

## Prerequisites

- **Java 17** (or 11) — e.g. Microsoft OpenJDK 17
- **Maven 3.9+**
- **Node.js 22** and **npm 10+**
- **PostgreSQL 14+** (via Homebrew or Docker)

## Step 1 — Start PostgreSQL

### Option A: Homebrew (macOS)

```bash
brew services start postgresql@14
```

### Option B: Docker

```bash
docker run --name todolistdb \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -p 5432:5432 -d postgres:16
```

## Step 2 — Create the Database and User

```bash
psql postgres -c "CREATE DATABASE todolist;"
psql postgres -c "CREATE USER todolist WITH ENCRYPTED PASSWORD 'todolist';"
psql postgres -c "GRANT ALL PRIVILEGES ON DATABASE todolist TO todolist;"
psql todolist -c "GRANT ALL ON SCHEMA public TO todolist;"
```

> **Note:** If using Docker, connect with `psql -h localhost -U postgres` instead, or exec into the container:
> ```bash
> docker exec -it todolistdb psql -U postgres -f /docker-entrypoint-initdb.d/init.sql
> ```

## Step 3 — Clone the Repository

```bash
git clone https://github.com/wesleyfuchter/todolist-spring-react.git
cd todolist-spring-react
```

## Step 4 — Build and Run the Backend

```bash
cd backend

# Set Java environment (adjust JAVA_HOME to your installation)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home"
export PATH=${JAVA_HOME}/bin:${PATH}

# Build (skip tests — the integration test requires a running DB context)
./mvnw clean package -DskipTests

# Run
java -jar target/todolist-0.0.1-SNAPSHOT.jar
```

The backend starts on **http://localhost:8090**. Flyway will auto-create the `tasks` table and sequence.

Verify with:
```bash
curl http://localhost:8090/tasks/pending
# Expected: []
```

## Step 5 — Install and Run the Frontend

Open a **new terminal**:

```bash
cd ui

npm install

# Required: Node.js 22 needs the legacy OpenSSL provider for react-scripts 4
NODE_OPTIONS=--openssl-legacy-provider npm start
```

The frontend starts on **http://localhost:3010**. Open it in your browser.

## Step 6 — Use the App

1. Navigate to **http://localhost:3010/pending**
2. Click the **+** (floating action button) to add a new todo
3. Type a description and click **Submit**
4. Check the checkbox to mark a todo as done
5. Navigate to **/done** in the sidebar to see completed items

## API Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET    | `/tasks/pending` | List all pending tasks |
| GET    | `/tasks/done`    | List all completed tasks |
| POST   | `/tasks`         | Create a new task (`{"title":"...","done":false}`) |
| PATCH  | `/tasks/{id}/set-as-done` | Mark task as done |
| PATCH  | `/tasks/{id}/set-as-pending` | Mark task as pending |

## Modernization Story (for JDConf Talk)

This app is a perfect modernization candidate because it has outdated dependencies on **both** the Java and Node.js sides:

### Backend Modernization Path
- **Java 11 → 21** — LTS-to-LTS upgrade
- **Spring Boot 2.5.5 → 3.x** — Jakarta namespace migration (`javax.*` → `jakarta.*`), security changes
- **Flyway** — version bump for Spring Boot 3 compatibility

### Frontend Modernization Path
- **react-scripts 4 → 5** — Webpack 5 upgrade (eliminates the `--openssl-legacy-provider` hack)
- **Material UI 4 → 5 (MUI)** — Package rename `@material-ui/*` → `@mui/*`, new theming API
- **react-router-dom 5 → 6** — New API (`Routes` instead of `Switch`, `useNavigate` instead of `useHistory`)
- **React 17 → 18** — `createRoot` API, concurrent features

## Cleanup

```bash
# Stop the backend (Ctrl+C in its terminal)
# Stop the frontend (Ctrl+C in its terminal)

# Stop PostgreSQL (if using Homebrew)
brew services stop postgresql@14

# Or remove Docker container
docker rm -f todolistdb
```
