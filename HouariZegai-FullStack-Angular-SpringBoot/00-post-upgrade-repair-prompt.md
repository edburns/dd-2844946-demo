# Post-Upgrade Repair Prompt

> Paste this into the GitHub Copilot chat window after the App Modernization
> automated upgrade completes. It addresses the gap between what the upgrade
> changed (package versions + TypeScript fixes) and what's needed to actually
> run the app.

---

## Context

App Modernization upgraded all 33 npm packages from Angular 8 / TypeScript
3.5 to Angular 21 / TypeScript 7 / Bootstrap 5. It also made valid source
code fixes: converting absolute imports to relative paths, updating
tsconfig options, and fixing TypeScript compilation issues.

However, the app's Angular module structure, templates, routing, and build
configuration are still Angular 8-era code. Angular 8 → 21 spans 13 major
versions with extensive breaking changes that go beyond package version
bumps. The upgraded packages cannot run the un-migrated application code.

To make the app runnable for the demo, the package versions need to be
reverted to Angular 8 while **keeping** the beneficial source code changes
(relative imports, etc.).

---

## Prompt

The automated App Modernization upgrade changed all npm package versions to
Angular 21 / TypeScript 7, but the application code (modules, templates,
routing) was not migrated to match. The app does not build or run with the
new package versions.

Please make the following changes to restore a runnable state while keeping
the source code improvements the upgrade made (relative imports, etc.).

### 1. Revert `crm-frontend/package.json` — restore Angular 8 package versions

The application code is still Angular 8 and cannot run with Angular 21
packages. Revert the dependency versions to:

**dependencies:**
```
"@angular/animations": "~8.2.0"
"@angular/common": "~8.2.0"
"@angular/compiler": "~8.2.0"
"@angular/core": "~8.2.0"
"@angular/forms": "~8.2.0"
"@angular/platform-browser": "~8.2.0"
"@angular/platform-browser-dynamic": "~8.2.0"
"@angular/router": "~8.2.0"
"angular-font-awesome": "^3.1.2"
"bootstrap": "^4.3.1"
"font-awesome": "^4.7.0"
"ngx-bootstrap": "^5.1.1"
"ngx-toastr": "^10.2.0"
"rxjs": "^6.4.0"
"tslib": "^1.10.0"
"zone.js": "~0.9.1"
```

**devDependencies:**
```
"@angular-devkit/build-angular": "~0.803.29"
"@angular/cli": "~8.3.29"
"@angular/compiler-cli": "~8.2.0"
"@angular/language-service": "~8.2.0"
"@types/node": "~8.9.4"
"@types/jasmine": "~3.3.8"
"@types/jasminewd2": "~2.0.3"
"codelyzer": "^5.0.0"
"jasmine-core": "~3.4.0"
"jasmine-spec-reporter": "~4.2.1"
"karma": "~4.1.0"
"karma-chrome-launcher": "~2.2.0"
"karma-coverage-istanbul-reporter": "~2.0.1"
"karma-jasmine": "~2.0.1"
"karma-jasmine-html-reporter": "^1.4.0"
"protractor": "~5.4.0"
"ts-node": "~7.0.0"
"tslint": "~5.15.0"
"typescript": "~3.5.3"
```

Remove the `@typescript/native-preview` package — it was added by the
upgrade but is not compatible with Angular 8.

### 2. Revert `crm-frontend/tsconfig.json` — moduleResolution

The upgrade changed `moduleResolution` from `"node"` to `"bundler"`.
The `"bundler"` value requires TypeScript 5+ and is incompatible with
TypeScript 3.5. Change it back:

**Before:** `"moduleResolution": "bundler"`
**After:** `"moduleResolution": "node"`

Keep the other tsconfig changes the upgrade made (they are harmless or
beneficial).

### 3. Fix `crm-frontend/src/app/app.module.ts` — ngx-bootstrap import path

This is a pre-existing bug in the original repo (not caused by the
upgrade). ngx-bootstrap 5.x requires subpath imports:

**Before:** `import { AlertModule } from 'ngx-bootstrap';`
**After:** `import { AlertModule } from 'ngx-bootstrap/alert';`

### 4. Reinstall dependencies and remove incompatible fsevents

```bash
cd crm-frontend
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
rm -rf node_modules/fsevents
```

- `--legacy-peer-deps` is needed because Angular 8 packages have peer
  dependency conflicts under modern npm.
- `fsevents` 1.x has native bindings incompatible with Node.js 22 on
  macOS. Removing it makes chokidar fall back to polling.

### 5. Set required environment variable when running the frontend

```bash
export NODE_OPTIONS=--openssl-legacy-provider
```

Angular CLI 8 uses a legacy OpenSSL hashing algorithm that Node.js 22
disables by default.

### 6. Verify

```bash
# Backend (from crm-rest/)
mvn clean package -DskipTests
java -jar target/crm-rest-0.0.1-SNAPSHOT.jar
# Should start on port 8080

# Frontend (from crm-frontend/)
export NODE_OPTIONS=--openssl-legacy-provider
npx ng serve --port 4200
# Should compile and serve on port 4200

# Test login
curl -s -X POST http://localhost:8080/authenticate \
  -H "Content-Type: application/json" \
  -d '{"username":"houarizegai","password":"0000"}'
# Should return a JWT token
```

---

## Why this is necessary

App Modernization correctly upgraded package versions and fixed TypeScript
source issues. However, migrating an Angular app across 13 major versions
requires changes to:
- NgModule declarations → standalone components (Angular 14+)
- Template syntax changes (Angular 9+ Ivy renderer)
- Routing API changes
- RxJS 6 → 7 operator changes
- Bootstrap 4 → 5 CSS class renames (`.ml-*` → `.ms-*`, etc.)

These structural changes were not performed, so the app cannot run with
the upgraded packages. Reverting the package versions while keeping the
source code fixes (relative imports) is the pragmatic path for the demo.
