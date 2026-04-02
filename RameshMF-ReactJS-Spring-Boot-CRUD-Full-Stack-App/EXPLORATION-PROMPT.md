# Candidate 4: RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App — Most Popular (720⭐)

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.

Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

## Repository

**URL:** https://github.com/RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App

## Why This Candidate

The **most popular** fullstack Spring Boot + React CRUD app on GitHub (720+ stars). It's a well-known tutorial project by Ramesh Fadatare (Java Guides). The frontend has very outdated Node.js dependencies while the backend is already on Java 17. Structure: `react-frontend/` and `springboot-backend/`.

### Backend (Java)
| Property | Value |
|---|---|
| Java version | 17 (already current — less upgrade story) |
| Spring Boot | 3.0.4 |
| Build tool | Maven |
| Database | MySQL |
| Key deps | Spring Data JPA, spring-boot-devtools |

### Frontend (Node.js / React)
| Property | Value |
|---|---|
| React | **16.13.1** (very old!) |
| react-scripts | **3.4.1** (very old!) |
| axios | **0.19.2** (known CVEs!) |
| Other | bootstrap 4.5.0, react-router-dom 5.2.0 |

### Modernization Story
- **Backend already at Java 17 / Spring Boot 3** — less dramatic for backend modernization
- **React 16 → 18**: Class components → hooks, concurrent features, new JSX transform
- **react-scripts 3 → 5**: Major webpack upgrade
- **axios 0.19.2 → 1.x**: Security vulnerabilities fixed, breaking API changes
- **react-router-dom 5 → 6**: Complete API overhaul
- **bootstrap 4 → 5**: jQuery removal, utility API changes

### Notes
- Requires MySQL. You may need to run `docker run --name mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=employee_management_system -p 3306:3306 -d mysql:8`.
- This is an **Employee management** CRUD app, not a todo list — but the pattern is identical.
- The frontend is mostly class-based React components — modernization could also include converting to hooks.
- ⚠️ The backend is already modern (Java 17 + Spring Boot 3). This candidate is best if you want to focus the demo primarily on **Node.js/React modernization** with a working Java backend already in place.
