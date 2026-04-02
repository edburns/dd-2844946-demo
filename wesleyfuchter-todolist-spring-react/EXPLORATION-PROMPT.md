# Candidate 3: wesleyfuchter/todolist-spring-react — Clean & Simple Todo

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.

Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

## Repository

**URL:** https://github.com/wesleyfuchter/todolist-spring-react

## Why This Candidate

Another **TODO list** app with a very clean and simple structure. Minimal complexity — no auth, no JWT — just a straightforward CRUD todo list with `backend/` and `ui/` directories.

### Backend (Java)
| Property | Value |
|---|---|
| Java version | **11** (upgrade target: 21) |
| Spring Boot | **2.5.5** (upgrade target: 3.x) |
| Build tool | Maven |
| Database | PostgreSQL |
| Key deps | Spring Data JPA, Flyway for migrations |

### Frontend (Node.js / React)
| Property | Value |
|---|---|
| React | 17.0.2 |
| react-scripts | 4.0.3 |
| react-router-dom | 5.3.0 |
| Other | Material UI 4.12.3, @material-ui/icons 4.11.2 |

### Modernization Story
- **Java 11 → 21**: LTS-to-LTS upgrade
- **Spring Boot 2.5.5 → 3.x**: Jakarta namespace migration, security changes
- **Material UI 4 → 5 (MUI)**: Package rename from `@material-ui/*` to `@mui/*`, completely different theming API
- **react-scripts 4 → 5**: Webpack upgrade, breaking changes
- **react-router-dom 5 → 6**: Completely new API (Routes instead of Switch, useNavigate instead of useHistory)
- **Flyway**: May need version bumps for Spring Boot 3 compatibility

### Notes
- Requires PostgreSQL. You may need to run `docker run --name postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=todolist -p 5432:5432 -d postgres:16`.
- Check `backend/src/main/resources/application.properties` for DB connection settings.
- Frontend runs on port 3000, backend on 8080.
- Very simple and clean — easiest to demo of all candidates.
