# Candidate 1: mehmetpekdemir/Todo-App — Best Overall Fit

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.

Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

## Repository

**URL:** https://github.com/mehmetpekdemir/Todo-App

## Why This Candidate

This is a **TODO app** — it matches the abstract's narrative perfectly. It has a clean separation of `backend/` and `frontend/` directories.

### Backend (Java)
| Property | Value |
|---|---|
| Java version | **11** (upgrade target: 21) |
| Spring Boot | **2.2.6.RELEASE** (upgrade target: 3.x) |
| Build tool | Maven |
| Database | MySQL |
| Key deps | Spring Security + JWT, Swagger (springfox 2.9.2), Spring Cloud Contract, Lombok |

### Frontend (Node.js / React)
| Property | Value |
|---|---|
| React | 17.0.1 |
| react-scripts | 4.0.2 |
| axios | 0.21.1 |
| Other | reactstrap 8.9.0, jwt-decode 3.1.2, alertifyjs 1.13.1, bootstrap 4.6.0 |

### Modernization Story
- **Java 11 → 21**: Major version jump across multiple LTS releases
- **Spring Boot 2.2.6 → 3.x**: Jakarta EE namespace migration, Spring Security overhaul
- **Old Node deps**: axios 0.21.x has known CVEs, react-scripts 4.x is outdated, reactstrap/bootstrap are behind
- **Swagger**: springfox → springdoc migration
- **JWT library**: jjwt 0.9.1 is very old

### Notes
- Requires MySQL. You may need to run `docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=tododb -p 3306:3306 -d mysql:8` or similar.
- Check `backend/src/main/resources/application.properties` for DB connection details.
- The frontend runs on port 3000 by default, backend on 8080.
