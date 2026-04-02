## 16:39 Prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.



## 16:47 Response

Excellent! Now I have a thorough picture. Let me compile the best candidates:

  ### Top Candidates Summary

  1. mehmetpekdemir/Todo-App ⭐ BEST FIT
     - Java 11, Spring Boot 2.2.6.RELEASE
     - React 17.0.1, react-scripts 4.0.2, axios 0.21.1
     - Actual Todo app! Perfect for the demo narrative
     - Hexagonal Architecture, JWT auth, Swagger, Contract tests
     - Clean `backend/` and `frontend/` separation
     - Though it does require MySQL and adds complexity with JWT and Spring 
  Security

  2. didinj/spring-boot-mongodb-react-java-crud ⭐ VERY OLD
     - Java 8, Spring Boot 2.0.0.RELEASE — quite dated
     - React 16.2.0, react-scripts 1.1.1, axios 0.18.0 — all significantly 
  outdated
     - Gradle-based rather than Maven, with MongoDB as the database requirement
     - ✅ The oldest option here

  3. GSkoba/spring-react-app
     - Java 8, Spring Boot 2.2.6.RELEASE — moderate age
     - React 16.13.1, react-scripts 3.4.1, with TypeScript ~3.7.2 support
     - Gradle-based with MongoDB, includes a Dockerfile, and the TypeScript 
  addition introduces another layer of complexity

  4. wesleyfuchter/todolist-spring-react
     - Java 11, Spring Boot 2.5.5 — more recent versions
     - React 17.0.2, react-scripts 4.0.3, Material UI 4.x
     - An actual working Todo application using Flyway and PostgreSQL with a 
  cleaner structure separating backend and frontend

  5. RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App (720⭐)
     - Java 17, Spring Boot 3.0.4 — the most modern backend
     - React 16.13.1, react-scripts 3.4.1, axios 0.19.2 — but the frontend is 
  significantly outdated
     - The most popular tutorial project, though the backend is already quite 
  current, leaving less room for a modernization narrative

  For the JDConf talk, I'm leaning toward the first option as the strongest 
  candidate since it's a Todo app that aligns with the talk's focus and has Java
   11 as a good starting point for demonstrating upgrades.

  The second option offers the most dramatic transformation story with Java 8 
  and Spring Boot 2.0, though it introduces MongoDB and Gradle as additional 
  dependencies. The third is another clean Todo app with PostgreSQL, while the 
  fourth has the widest audience recognition but less modernization potential 
  since the backend is already at Java 17.

● Here are the top 5 candidates I found, ranked by fit for your JDConf
  modernization demo:

  ---------------------------------------------------------------------------

  🥇 1. mehmetpekdemir/Todo-App — Best Overall Fit

  ┌─────────────┬────────────────────────────────────┬───────────────────────┐
  │             │ Backend                            │ Frontend              │
  ├─────────────┼────────────────────────────────────┼───────────────────────┤
  │ Java        │ 11 → upgrade to 21                 │ —                     │
  ├─────────────┼────────────────────────────────────┼───────────────────────┤
  │ Spring Boot │ 2.2.6.RELEASE → 3.x                │ —                     │
  ├─────────────┼────────────────────────────────────┼───────────────────────┤
  │ React       │ —                                  │ 17.0.1, react-scripts │
  │             │                                    │ 4.0.2                 │
  ├─────────────┼────────────────────────────────────┼───────────────────────┤
  │ Other       │ JWT, Swagger, Spring Security,     │ axios 0.21.1,         │
  │             │ Contract Tests                     │ reactstrap 8.9        │
  ├─────────────┼────────────────────────────────────┼───────────────────────┤
  │ DB          │ MySQL                              │ —                     │
  └─────────────┴────────────────────────────────────┴───────────────────────┘

  ✅ It's a TODO app — matches your abstract perfectly. Java 11 + Spring Boot
  2.x gives a clear modernization path. Hexagonal architecture is a nice
  talking point. Requires MySQL.

  ---------------------------------------------------------------------------

  🥈 2. didinj/spring-boot-mongodb-react-java-crud — Most Dramatic Upgrade

  ┌───────────────┬────────────────────────┬─────────────────────────────────┐
  │               │ Backend                │ Frontend                        │
  ├───────────────┼────────────────────────┼─────────────────────────────────┤
  │ Java          │ 8 → upgrade to 21      │ —                               │
  ├───────────────┼────────────────────────┼─────────────────────────────────┤
  │ Spring Boot   │ 2.0.0.RELEASE (2018!)  │ —                               │
  ├───────────────┼────────────────────────┼─────────────────────────────────┤
  │ React         │ —                      │ 16.2.0, react-scripts 1.1.1     │
  ├───────────────┼────────────────────────┼─────────────────────────────────┤
  │ Build         │ Gradle                 │ axios 0.18.0                    │
  ├───────────────┼────────────────────────┼─────────────────────────────────┤
  │ DB            │ MongoDB                │ —                               │
  └───────────────┴────────────────────────┴─────────────────────────────────┘

  ✅ Oldest stack = biggest "wow factor" for modernization. Everything is
  ancient. ⚠️ Gradle-based (not Maven), requires MongoDB.

  ---------------------------------------------------------------------------

  🥉 3. wesleyfuchter/todolist-spring-react — Clean & Simple Todo

  ┌───────────┬───────────────────────────────┬─────────────────────────────┐
  │           │ Backend                       │ Frontend                    │
  ├───────────┼───────────────────────────────┼─────────────────────────────┤
  │ Java      │ 11, Spring Boot 2.5.5         │ —                           │
  ├───────────┼───────────────────────────────┼─────────────────────────────┤
  │ React     │ —                             │ 17.0.2, react-scripts 4.0.3 │
  ├───────────┼───────────────────────────────┼─────────────────────────────┤
  │ Other     │ Flyway migrations             │ Material UI 4.x             │
  ├───────────┼───────────────────────────────┼─────────────────────────────┤
  │ DB        │ PostgreSQL                    │ —                           │
  └───────────┴───────────────────────────────┴─────────────────────────────┘

  ✅ Another TODO app, very clean separation (backend/ + ui/). Simpler than 
  #1.
  Requires PostgreSQL.

  ---------------------------------------------------------------------------

  4. RameshMF/ReactJS-Spring-Boot-CRUD-Full-Stack-App — Most Popular (720⭐)

  ┌───────────┬───────────────────────┬──────────────────────────────────────┐
  │           │ Backend               │ Frontend                             │
  ├───────────┼───────────────────────┼──────────────────────────────────────┤
  │ Java      │ 17, Spring Boot 3.0.4 │ —                                    │
  ├───────────┼───────────────────────┼──────────────────────────────────────┤
  │ React     │ —                     │ 16.13.1, react-scripts 3.4.1         │
  ├───────────┼───────────────────────┼──────────────────────────────────────┤
  │ Other     │ Employee CRUD         │ axios 0.19.2, bootstrap 4.5          │
  ├───────────┼───────────────────────┼──────────────────────────────────────┤
  │ DB        │ MySQL                 │ —                                    │
  └───────────┴───────────────────────┴──────────────────────────────────────┘

  ✅ Very old Node/React deps — great for frontend modernization. ⚠️ Backend 
  is
  already at Java 17/SB 3 so less upgrade story there. Employee CRUD, not
  todo.

  ---------------------------------------------------------------------------

  5. GSkoba/spring-react-app — Java 8 + TypeScript

  ┌───────────┬─────────────────────────┬────────────────────────────────────┐
  │           │ Backend                 │ Frontend                           │
  ├───────────┼─────────────────────────┼────────────────────────────────────┤
  │ Java      │ 8, Spring Boot 2.2.6    │ —                                  │
  ├───────────┼─────────────────────────┼────────────────────────────────────┤
  │ React     │ —                       │ 16.13.1, react-scripts 3.4.1, TS   │
  │           │                         │ 3.7                                │
  ├───────────┼─────────────────────────┼────────────────────────────────────┤
  │ Build     │ Gradle                  │ TypeScript adds extra dimension    │
  ├───────────┼─────────────────────────┼────────────────────────────────────┤
  │ DB        │ MongoDB                 │ Has Dockerfile                     │
  └───────────┴─────────────────────────┴────────────────────────────────────┘

  ✅ Java 8 for dramatic backend upgrade. TypeScript frontend adds variety. ⚠️
  Gradle + MongoDB.
  
## 16:48 Prompt

Make sub-directories for each of your top-five. To derive the directory name, convert slashes to hyphens.

In each directory, include the corresponding content from your section in a file called `EXPLORATION-PROMPT.md`.

At the header of this file include this text:

-------

This file one of several responses to the following prompt

Consider my abstract for my talk at JDConf 2026 next week.

> Legacy applications rarely live in isolation. Many real-world systems combine technologies like Node.js and Java, and over time, outdated dependencies and runtimes become a major barrier to security, performance, and innovation. In this session, we'll take a typical enterprise Java app with a Node.js front end that hasn't been updated in years and modernize it end-to-end using GitHub Copilot App Modernization. We'll start by upgrading ill-maintained Node.js dependencies, addressing breaking changes and security issues along the way. Then we'll turn to the backend Java service, upgrading it from an older Java version to a modern, supported JDK, resolving compatibility issues and improving maintainability.

Searching GitHub, find several candidates that meet this requirement:

   a reasonably small, self-contained, and easily demoable project that satisfies the requirements of having a Node.js front end and a Java back end. For example, a to do list with a REST back end. It needs to be easily runnable.
   
Please clone, build, and run the described app. Use whatever tools are necessary.

Produce a file `DEMO-README.md` that shows a human user the simplest complete steps necessary to run the demo in the context of the JDConf talk.

--------

I will launch separate `copilot --yolo` sessions, one for each directory, to execute what you have written as `EXPLORATION-PROMPT.md`.

## 16:50 Response

Now I'll create all five EXPLORATION-PROMPT.md files:

● Create EXPLORATION-PROMPT.md +55
  └ mehmetpekdemir-Todo-App/EXPLORATION-PROMPT.md

● Create EXPLORATION-PROMPT.md +57
  └ didinj-spring-boot-mongodb-react-java-crud/EXPLORATION-PROMPT.md

● Create EXPLORATION-PROMPT.md +57
  └ wesleyfuchter-todolist-spring-react/EXPLORATION-PROMPT.md

● Create EXPLORATION-PROMPT.md +57
  └ RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App/EXPLORATION-PROMPT.md

● Create EXPLORATION-PROMPT.md +60
  └ GSkoba-spring-react-app/EXPLORATION-PROMPT.md

● Let me verify the structure:

● Verify directory structure (shell)
  │ find /Users/edburns/workareas/dd-2844946-demo -type f -name "*.md" | sort
  └ 8 lines...

● Done. Five directories created, each with an EXPLORATION-PROMPT.md:

   dd-2844946-demo/
   ├── mehmetpekdemir-Todo-App/EXPLORATION-PROMPT.md          # 🥇 Java 11 + 
  SB 2.2.6 TODO app
   ├── didinj-spring-boot-mongodb-react-java-crud/EXPLORATION-PROMPT.md  # 🥈 
  Java 8 + SB 2.0.0
   ├── wesleyfuchter-todolist-spring-react/EXPLORATION-PROMPT.md         # 🥉 
  Java 11 + SB 2.5.5 TODO
   ├── RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App/EXPLORATION-PROMPT.md 
   # 720⭐ old React
   └── GSkoba-spring-react-app/EXPLORATION-PROMPT.md          # Java 8 + 
  TypeScript


Read `EXPLORATION-PROMPT.md` and execute it as a prompt.

## 17:12 Prompt

Investigate the resultant `DEMO-README.md` files in each subdirectory and fill out the following markdown table. Write the result to `EXPLORATION-RESULT.md`. The apps are all currently running, that is if the DEMO-README.md says they were made to run.

Each column, aside from the first, asks a question. Here is some help in getting answers

- Is the app usable?

   - Answer yes if all of the following are true:

      - Did the front-end come up?

      - Can you interact with it in a reasonable way?

- Does front-end have upgrade potential?

   - Answer yes if:

      - the current version of the front end stack is sufficiently old when compared to the latest versions of the front end stack such that the upgrade tool could concievably do a good job.

      Also give a brief explanation of your answer.

- Does back-end have upgrade potential?

   - Answer yes if:

      - the current version of the front end stack is sufficiently old when compared to the latest versions of the front end stack such that the upgrade tool could concievably do a good job.

      Also give a brief explanation of your answer.

- Does the current app mod work with front-end?

   - Don't answer this yet. I need to install it. This will likely require human activity.

- Does the current app mod work with back-end?

   - Don't answer this yet. I need to install it. This will likely require human activity.

- On a scale of 1 - 10, how complicated is it for me to execute the DEMO-README.md?

   - Examine the complexity of the DEMO-README.md. How hard would it be to set up? How many external dependencies? Is it easy to follow?


Now. Here's the table.





| subdirectory | Is the app usable? | Does front-end have upgrade potential? | Does back-end have upgrade potential? | Does the current app mod work with front-end? | Does the current app mod work with back-end? | On a scale of 1 - 10, how complicated is it for me to execute the DEMO-README.md? |
|------------|-----------|---------------------------------|--------------------------------|-------------------------------------|------------------------------------|-------|

## 17:30 Response

Now I have all the information I need to build the table. Let me also check 
  the DEMO-README complexity for each project.

  Let me assess each candidate:

  ### 1. mehmetpekdemir-Todo-App
  - Is the app usable? YES — Backend on 8085 (Swagger UI works), Frontend on 
  3004 (returns HTML with `<title>Todo App</title>` and `<div id="root"`). It 
  has signup/login and todo CRUD.
  - Frontend upgrade potential? YES — React 17, react-scripts 4.0.2, axios 
  0.21.1 (CVEs), bootstrap 4.6, reactstrap 8.9, jwt-decode 3.1.2. All 
  significantly outdated.


  - Backend upgrade potential? YES — Java 11 and Spring Boot 2.2.6 are both ripe
   for major upgrades to Java 21 and Spring Boot 3.x, which would require 
  Jakarta namespace migration.
  - DEMO-README complexity? Around 4 out of 10 — Docker is needed for MySQL, 
  plus Java environment setup, Maven build, and npm install/start. 
  Straightforward overall but MySQL adds an external dependency.

  ### 2. didinj-spring-boot-mongodb-react-java-crud
  - Is the app usable? NO — The backend build process is suspended and neither 
  backend nor frontend is reachable.
  - Frontend upgrade potential? YES — React 16.2 and react-scripts 1.1.1 are 
  extremely outdated, along with axios 0.18.0.
  - Backend upgrade potential? YES — Java 8 and Spring Boot 2.0.0 represent the 
  most dramatic upgrade opportunity available.
  - DEMO-README complexity? Around 6 out of 10 — Docker for MongoDB, Java 8 
  Temurin, and Gradle are all required, but the fact that the app didn't build 
  or run successfully suggests there may be underlying complications.

  ### 3. wesleyfuchter-todolist-spring-react
  - Is the app usable? YES — Backend serves JSON on 8090, frontend renders on 
  3010, and CRUD operations work.
  - Frontend upgrade potential? YES — React 17, react-scripts 4.0.3, and 
  Material UI 4.12.3 can all be upgraded, with Material UI 4 to 5 being a 
  particularly significant migration.
  - Backend upgrade potential? YES — Java 11 and Spring Boot 2.5.5 have a clear 
  upgrade path to Java 21 and Spring Boot 3.

  ### 4. RameshMF-ReactJS-Spring-Boot-CRUD-Full-Stack-App
  - Is the app usable? YES — Backend on 8084 and frontend on 3005 both work, 
  with employee CRUD functionality operational.
  - Frontend upgrade potential? YES — React 16.13.1, react-scripts 3.4.1, axios 
  0.19.2 with known CVEs, bootstrap 4.5, and react-router-dom 5.2 are all 
  significantly outdated.
  - Backend upgrade potential? NO — Already running Java 17 and Spring Boot 
  3.0.4, so the backend is already modern.
  - DEMO-README complexity? Around 5 out of 10 — PostgreSQL setup via Docker or 
  Homebrew, database creation commands, Java environment, Maven, and npm all 
  need configuration, with the psql commands adding extra setup steps.

  ### 5. GSkoba-spring-react-app
  - Is the app usable? YES — Backend on 8082 serves todos JSON with seed data, 
  frontend on 3002 displays the React app, and the todo list functions properly.
  - Frontend upgrade potential? YES — React 16.13.1, react-scripts 3.4.1, and 
  TypeScript 4.0 are old but upgradeable.
  - Backend upgrade potential? YES — Java 8 and Spring Boot 2.2.6 could be 
  upgraded to Java 21 and Spring Boot 3.x.
  - DEMO-README complexity? Around 5 out of 10 — Requires either MongoDB or code
   modifications for in-memory mode, plus Gradle has Java version constraints 
  and TypeScript adds setup overhead.

  Now I'm putting together the exploration results document.

● Now I have all the data I need. Let me create the results file.

● Create EXPLORATION-RESULT.md +10

● Done. Created EXPLORATION-RESULT.md at the root. Key findings:

   - 4 of 5 apps are running — only didinj failed (Gradle build suspended, 
  never started)
   - Best all-around: mehmetpekdemir-Todo-App — usable, upgrade potential on 
  both sides, complexity 4
   - Easiest to run: RameshMF (complexity 2, H2 in-memory) — but backend is 
  already modern
   - Best upgrade story: mehmetpekdemir or GSkoba have both Java 8/11 + old 
  React
   - TBD columns left blank for app mod testing as requested.
   
## 17:31 Prompt

Hey, I observe `mehmetpekdemir-Todo-App` has a "login page". What credentials should I use?
