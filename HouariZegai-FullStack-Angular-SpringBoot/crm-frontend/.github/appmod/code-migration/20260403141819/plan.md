# TypeScript Package Upgrade Plan

**Migration Session ID:** 20260403141819  
**Tool Session ID:** 3456a346-fb2b-4ec1-9194-3fb9ec0759f9  
**Time:** 2026-04-03 14:18:19  
**Uncommitted Changes Policy:** Always Stash  
**Target Branch:** `appmod/typescript-upgrade-20260403141819`  
**Programming Language:** TypeScript (Angular 8.2)

---

## Project Summary

- **Angular:** ~8.2.0
- **TypeScript:** ~3.5.3
- **Node Types:** ~8.9.4
- **RxJS:** ^6.4.0
- **Bootstrap:** ^4.3.1

---

## Upgrade Steps

1. Install dependencies
2. Compile package (baseline error count)
3. Angular upgrade via `ng update`
4. Migrate to latest TypeScript via `migrate_typescript`
5. Upgrade package groups (in order):
   - `@types/node`, `typescript`
   - `bootstrap`
   - `ts-node`
   - `tslib`
   - `@angular/cli`
   - `@angular/language-service`
   - `@types/jasmine`
   - `@types/jasminewd2`
   - Angular framework + ecosystem (animations, common, compiler, core, forms, platform-browser, platform-browser-dynamic, router, ngx-bootstrap, ngx-toastr, rxjs, zone.js, build-angular, compiler-cli, codelyzer, jasmine-core, karma, karma-jasmine, karma-jasmine-html-reporter, protractor, tslint)
   - `jasmine-spec-reporter`
   - `karma-chrome-launcher`
   - `karma-coverage-istanbul-reporter`
6. Compile & test validation
7. Generate upgrade summary

---

## Files to be Changed

- `package.json`
- `tsconfig.json`
- `tsconfig.app.json`
- `tsconfig.spec.json`
- Source files (as needed for TypeScript migration)
