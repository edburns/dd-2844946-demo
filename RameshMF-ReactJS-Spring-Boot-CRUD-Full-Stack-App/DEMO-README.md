# Demo: ReactJS + Spring Boot CRUD Full-Stack App

**Source:** [RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App](https://github.com/RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App) (720+ ⭐)

An **Employee Management System** — React 16 frontend with a Spring Boot 3 / Java 17 REST backend. Ideal for demonstrating Node.js/React modernization at JDConf 2026.

---

## Prerequisites

| Tool | Version | Notes |
|------|---------|-------|
| Java | 17 | `java -version` to check |
| Maven | 3.8+ | `mvn -version` to check |
| Node.js | 18+ | Tested with 22. `node --version` to check |
| npm | 8+ | Comes with Node.js |

> **No database required.** The backend is configured to use an H2 in-memory database.

---

## Quick Start (3 steps)

### 1. Clone the repo

```bash
git clone https://github.com/RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App.git
cd ReactJS-Spring-Boot-CRUD-Full-Stack-App
```

### 2. Start the Spring Boot backend (port 8084)

```bash
cd springboot-backend
mvn clean package -DskipTests
java -jar target/springboot-backend-0.0.1-SNAPSHOT.jar &
cd ..
```

Wait for `Started SpringbootBackendApplication` in the output, then verify:

```bash
curl http://localhost:8084/api/v1/employees
# Expected: []
```

### 3. Start the React frontend (port 3005)

```bash
cd react-frontend
npm install
NODE_OPTIONS=--openssl-legacy-provider BROWSER=none PORT=3005 npx react-scripts start
```

Open **http://localhost:3005** in your browser.

---

## What You'll See

An employee management CRUD app:
- **List** all employees on the home page
- **Add** a new employee (first name, last name, email)
- **View** employee details
- **Update** an employee
- **Delete** an employee

---

## Pre-Demo Changes Made

The following changes were made from the original repo to make it runnable without MySQL:

1. **H2 database** — Added `h2` dependency to `pom.xml` and switched `application.properties` from MySQL to H2 in-memory (original MySQL config is commented out).
2. **Port 8084** — Backend runs on `8084` instead of `8080` (set in `application.properties`).
3. **Port 3005** — Frontend runs on `3005` instead of `3000` (set via `PORT` env var at startup).
4. **CORS origin** — `EmployeeController.java` updated to allow `http://localhost:3005`.
5. **Frontend API URL** — `EmployeeService.js` updated to point to `http://localhost:8084`.

---

## Modernization Story (for the JDConf talk)

### What's outdated (frontend)

| Package | Current | Latest | Impact |
|---------|---------|--------|--------|
| react | 16.13.1 | 18+ | Class components → hooks, concurrent features |
| react-scripts | 3.4.1 | 5+ | Webpack 4→5, requires `NODE_OPTIONS=--openssl-legacy-provider` on Node 17+ |
| axios | 0.19.2 | 1.x | **Known CVEs**, breaking API changes |
| react-router-dom | 5.2.0 | 6+ | Complete API overhaul |
| bootstrap | 4.5.0 | 5+ | jQuery removal, utility API changes |

### Key modernization steps to demonstrate

1. **`npm audit`** — Shows 220 vulnerabilities (16 critical) from outdated deps
2. **Upgrade react-scripts 3→5** — Removes need for `--openssl-legacy-provider`
3. **Upgrade React 16→18** — New root API (`createRoot`), JSX transform
4. **Upgrade axios 0.19→1.x** — Fix CVEs, update response/error handling
5. **Upgrade react-router-dom 5→6** — `Switch`→`Routes`, `component`→`element`
6. **Upgrade bootstrap 4→5** — Drop jQuery, update class names
7. **Convert class components to functional components with hooks** — Modern React patterns

---

## Stopping the Demo

```bash
# Stop frontend: Ctrl+C in the terminal running react-scripts

# Stop backend:
lsof -i :8084 -t | xargs kill
```

---

## Architecture

```
┌─────────────────────┐        REST API        ┌─────────────────────┐
│   React Frontend    │ ────────────────────→   │  Spring Boot API    │
│   localhost:3005    │   /api/v1/employees     │  localhost:8084     │
│                     │ ←────────────────────   │                     │
│  • React 16.13.1    │        JSON             │  • Java 17          │
│  • axios 0.19.2     │                         │  • Spring Boot 3.0.4│
│  • bootstrap 4.5.0  │                         │  • H2 (in-memory)   │
│  • react-router 5   │                         │  • Spring Data JPA  │
└─────────────────────┘                         └─────────────────────┘
```
