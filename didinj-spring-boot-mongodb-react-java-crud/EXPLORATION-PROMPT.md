# Candidate 2: didinj/spring-boot-mongodb-react-java-crud — Most Dramatic Upgrade

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.

Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

## Repository

**URL:** https://github.com/didinj/spring-boot-mongodb-react-java-crud

## Why This Candidate

This is the **oldest stack** of all candidates — everything is from 2018. It gives the most dramatic "before and after" modernization story. The `frontend/` directory is a separate React app; the backend is a Gradle-based Spring Boot app at the root.

### Backend (Java)
| Property | Value |
|---|---|
| Java version | **8** (`sourceCompatibility = 1.8`) — upgrade target: 21 |
| Spring Boot | **2.0.0.RELEASE** (extremely old!) |
| Build tool | Gradle |
| Database | MongoDB |
| Key deps | spring-boot-starter-data-mongodb, spring-boot-starter-web |

### Frontend (Node.js / React)
| Property | Value |
|---|---|
| React | **16.2.0** |
| react-scripts | **1.1.1** (very old!) |
| axios | **0.18.0** |
| Other | react-router-dom 4.2.2, bootstrap 4.0.0 |

### Modernization Story
- **Java 8 → 21**: Massive jump — covers Java 9 modules, records, sealed classes, pattern matching, virtual threads
- **Spring Boot 2.0.0 → 3.x**: Biggest possible Spring Boot migration — includes Jakarta namespace, new security model, many deprecations
- **Gradle build file**: Uses deprecated `compile` keyword (now `implementation`)
- **React 16.2 → 18+**: Hooks, concurrent mode, new JSX transform
- **react-scripts 1.1.1 → 5.x**: Webpack 4→5, major breaking changes
- **axios 0.18 → 1.x**: Breaking changes in error handling and defaults

### Notes
- Requires MongoDB. You may need to run `docker run --name mongo -p 27017:27017 -d mongo:7`.
- The frontend build script copies output into `src/main/resources/static` — it's designed to serve the React app from the Spring Boot app.
- Uses Gradle (not Maven) — run with `./gradlew bootRun`.
- Created in 2018, last meaningful update years ago.
