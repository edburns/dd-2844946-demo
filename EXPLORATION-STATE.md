# EXPLORATION-STATE.md — Session Context for JDConf 2026 Demo Prep

> **Purpose**: This file captures the full context of a multi-session exploration to find, clone, build, and evaluate demo candidates for a JDConf 2026 talk. Read this file to understand what has been done, what the current state is, and what remains.

---

## 1. The Talk Abstract

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

## 2. What We Were Looking For

A reasonably small, self-contained, and easily demoable GitHub project with:
- A **Node.js front end** (React preferred)
- A **Java back end** (Spring Boot preferred)
- **Old enough** that both frontend and backend have meaningful upgrade potential
- **Easily runnable** for a live conference demo

## 3. The Five Candidates

We searched GitHub and evaluated five projects. Each lives in its own subdirectory.

### Directory Layout

```
dd-2844946-demo/
├── EXPLORATION-RESULT.md          # Comparison table (see Section 6)
├── EXPLORATION-STATE.md           # THIS FILE
├── mehmetpekdemir-Todo-App/       # Candidate 1 — BEST OVERALL FIT
│   ├── EXPLORATION-PROMPT.md      # Research notes
│   ├── DEMO-README.md             # How to run it
│   ├── backend/                   # Cloned directly (not in repo/ subdir)
│   ├── frontend/
│   ├── docs/
│   └── LICENSE
├── didinj-spring-boot-mongodb-react-java-crud/   # Candidate 2
│   ├── EXPLORATION-PROMPT.md
│   ├── DEMO-README.md
│   ├── build.gradle               # Cloned directly (not in repo/ subdir)
│   ├── frontend/
│   ├── src/
│   └── gradle/
├── wesleyfuchter-todolist-spring-react/           # Candidate 3
│   ├── EXPLORATION-PROMPT.md
│   ├── DEMO-README.md
│   └── repo/                      # Cloned into repo/ subdir
│       ├── backend/
│       └── ui/
├── RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App/  # Candidate 4
│   ├── EXPLORATION-PROMPT.md
│   ├── DEMO-README.md
│   └── repo/                      # Cloned into repo/ subdir
│       ├── springboot-backend/
│       └── react-frontend/
└── GSkoba-spring-react-app/       # Candidate 5
    ├── EXPLORATION-PROMPT.md
    ├── DEMO-README.md
    └── repo/                      # Cloned into repo/ subdir
        ├── src/
        ├── frontend/
        └── build.gradle
```

**Important structural note**: Two repos (mehmetpekdemir, didinj) were cloned directly into their candidate directory. The other three (wesleyfuchter, RameshMF, GSkoba) were cloned into a `repo/` subdirectory within their candidate directory. This affects path references in each `DEMO-README.md`.

## 4. Candidate Summary Table

| # | Candidate | Java | Spring Boot | React | react-scripts | Database | App Type |
|---|-----------|------|-------------|-------|---------------|----------|----------|
| 1 | mehmetpekdemir-Todo-App | **11** | **2.2.6** | 17 | 4.0.2 | MySQL (Docker) | Todo + JWT auth |
| 2 | didinj-spring-boot-mongodb-react-java-crud | **8** | **2.0.0** | 16.2 | **1.1.1** | MongoDB (Docker) | Contacts CRUD |
| 3 | wesleyfuchter-todolist-spring-react | **11** | **2.5.5** | 17 | 4.0.3 | PostgreSQL | Todo |
| 4 | RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App | 17 | 3.0.4 | **16.13** | **3.4.1** | H2 (in-memory) | Employee CRUD |
| 5 | GSkoba-spring-react-app | **8** | **2.2.6** | 16.13 | 3.4.1 | MongoDB or in-mem | Todo (TypeScript) |

## 5. What Was Done to Each Candidate

Each candidate was cloned, and a separate Copilot session attempted to build and run it. The results:

### Candidate 1: mehmetpekdemir-Todo-App ✅ RUNS
- Cloned from https://github.com/mehmetpekdemir/Todo-App
- **Local modifications** (in git diff):
  - `backend/pom.xml`: Bumped Lombok to 1.18.30 (fixes Java 17 IllegalAccessError)
  - `backend/src/main/resources/application.properties`: Configured for local MySQL
  - `frontend/src/services/url.js`: Updated API URL to match backend port 8085
- **Ports**: Backend 8085, Frontend 3004, MySQL 3306
- **Pre-seeded credentials**: `Mehmet1`/`Mehmet1` (ADMIN), `Mehmet2`/`Mehmet2` (USER)
- **Status**: Successfully built and ran. Frontend, backend, and CRUD all work.

### Candidate 2: didinj-spring-boot-mongodb-react-java-crud ❌ DID NOT RUN
- Cloned from https://github.com/didinj/spring-boot-mongodb-react-java-crud
- **Local modifications**: Updated application.properties, rebuilt frontend static assets
- **Problem**: Requires Java 8 Temurin JDK. Gradle 4.5 is incompatible with Java 17+. Build process was suspended/never completed.
- **Known code bugs**: `Edit.js` sends wrong field name; JSX uses `class` instead of `className`
- **Status**: Failed to run.

### Candidate 3: wesleyfuchter-todolist-spring-react ✅ RUNS
- Cloned from https://github.com/wesleyfuchter/todolist-spring-react into `repo/`
- **Local modifications**:
  - `backend/src/main/resources/application.properties`: Added PostgreSQL config
  - `ui/src/task-service.js`: Updated API URL to backend port 8090
- **Ports**: Backend 8090, Frontend 3010, PostgreSQL 5432
- **Status**: Successfully built and ran. Todo CRUD works.

### Candidate 4: RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App ✅ RUNS
- Cloned from https://github.com/RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App into `repo/`
- **Local modifications**:
  - `springboot-backend/pom.xml`: Added H2 dependency (removed MySQL requirement)
  - `springboot-backend/src/main/resources/application.properties`: Switched to H2 in-memory DB, port 8084
  - `react-frontend/src/services/EmployeeService.js`: Updated API URL to port 8084
  - `EmployeeController.java`: Updated CORS origin to port 3005
- **Ports**: Backend 8084, Frontend 3005
- **Status**: Successfully built and ran. Employee CRUD works. **No external DB needed (H2).**

### Candidate 5: GSkoba-spring-react-app ✅ RUNS
- Cloned from https://github.com/GSkoba/spring-react-app into `repo/`
- **Local modifications**:
  - `src/main/java/.../NxSpringWorkshopApplication.java`: Excluded Mongo auto-configuration for in-memory mode
  - `src/main/resources/application.properties`: Set dev profile, port 8082
  - `frontend/package.json`: Bumped TypeScript from ~3.7.2 to ~4.0.0
  - `frontend/src/App.tsx`: Updated API URL to port 8082
- **Ports**: Backend 8082, Frontend 3002
- **Status**: Successfully built and ran. Todo list with 3 seed items works.

## 6. Evaluation Results

See `EXPLORATION-RESULT.md` for the full comparison table. Summary:

| Candidate | Usable? | FE Upgrade? | BE Upgrade? | Complexity |
|---|---|---|---|---|
| mehmetpekdemir-Todo-App | ✅ | ✅ | ✅ | 4/10 |
| didinj-spring-boot-mongodb-react-java-crud | ❌ | ✅ | ✅ | 7/10 |
| wesleyfuchter-todolist-spring-react | ✅ | ✅ | ✅ | 5/10 |
| RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App | ✅ | ✅ | ❌ (already modern) | 2/10 |
| GSkoba-spring-react-app | ✅ | ✅ | ✅ | 5/10 |

**Two columns are TBD**: "Does current app mod work with front-end?" and "Does current app mod work with back-end?" — these require installing GitHub Copilot App Modernization, which will require human activity.

## 7. Recommendations

For the JDConf talk, the best candidates are:

1. **mehmetpekdemir-Todo-App** — Best overall. It's a todo app (matches abstract), has strong upgrade potential on BOTH sides (Java 11→21, SB 2.2.6→3.x, React 17→18+, axios CVEs), and includes JWT auth for real-world flavor.

2. **RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App** — Easiest to demo (no external DB, complexity 2/10), very old frontend (React 16, 220 npm vulnerabilities). But backend is already modern — only useful if focusing on frontend modernization.

3. **wesleyfuchter-todolist-spring-react** — Good all-around candidate. Simpler than mehmetpekdemir (no auth), but requires PostgreSQL.

## 8. Current State (as of 2026-04-02)

- **All apps are STOPPED** — no processes running on any demo ports
- **All Docker containers are REMOVED** — no MySQL, MongoDB, or PostgreSQL containers
- **All repos have uncommitted local modifications** — the build/run fixes described in Section 5
- **Build artifacts exist** — `target/`, `build/`, `node_modules/` directories are present but should be .gitignored
- **Log files exist** — `*-job-logs.txt` files in several directories from Maven builds

## 9. What Remains To Do

- [ ] Set up `.gitignore` for the outer repo (exclude `node_modules/`, `target/`, `build/`, `.gradle/`, `*-job-logs.txt`, etc.)
- [ ] Commit everything to git
- [ ] Install GitHub Copilot App Modernization and test it against the candidates
- [ ] Fill in the TBD columns in `EXPLORATION-RESULT.md`
- [ ] Choose the final candidate for the JDConf talk
- [ ] Rehearse the demo end-to-end

## 10. Environment Notes

- **macOS (Darwin)**
- **Java 17**: `/Library/Java/JavaVirtualMachines/microsoft-17.jdk/Contents/Home`
- **Java 8** (for didinj only): `/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home`
- **Maven 3.9.8**: `${HOME}/Downloads/apache-maven-3.9.8`
- **Node.js 22+** with npm 10+
- **Docker Desktop** available for database containers
- **`NODE_OPTIONS=--openssl-legacy-provider`** is required for all old react-scripts versions on Node 22+
