# Candidate 5: GSkoba/spring-react-app — Java 8 + TypeScript

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.

Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

## Repository

**URL:** https://github.com/GSkoba/spring-react-app

## Why This Candidate

A **Java 8** backend with a **TypeScript** React frontend. The TypeScript angle adds another modernization dimension. Uses Gradle and MongoDB. Has a Dockerfile. Structure: `frontend/` and `src/` (backend at root).

### Backend (Java)
| Property | Value |
|---|---|
| Java version | **8** (`sourceCompatibility = '1.8'`) — upgrade target: 21 |
| Spring Boot | **2.2.6.RELEASE** |
| Build tool | Gradle |
| Database | MongoDB (via spring-data-mongodb 2.2.5) |
| Key deps | Lombok, Spring Actuator, spring-boot-devtools |

### Frontend (Node.js / React + TypeScript)
| Property | Value |
|---|---|
| React | **16.13.1** |
| react-scripts | **3.4.1** |
| TypeScript | **~3.7.2** (very old!) |
| Other | @types/react 16.9.0, @types/node 12.0.0 |

### Modernization Story
- **Java 8 → 21**: Massive upgrade — modules, records, sealed classes, pattern matching, virtual threads
- **Spring Boot 2.2.6 → 3.x**: Jakarta namespace, Spring Data MongoDB API changes
- **Gradle build**: Uses deprecated `compile` keyword → `implementation`
- **TypeScript 3.7 → 5.x**: Template literal types, satisfies operator, const type parameters
- **React 16 → 18 with TypeScript**: Updated type definitions, new JSX transform
- **react-scripts 3 → 5**: Webpack 4→5, node polyfill changes
- **@types packages**: All extremely outdated

### Notes
- Requires MongoDB. You may need to run `docker run --name mongo -p 27017:27017 -d mongo:7`.
- Uses Gradle — run with `./gradlew bootRun`.
- The frontend is TypeScript-based which adds an interesting dimension to the modernization story (TS 3.7 → 5.x).
- Described as a "workshop" app — designed for teaching.
- Has a Dockerfile, though it may need updating.
- Check `src/main/resources/application.properties` for MongoDB connection settings.
