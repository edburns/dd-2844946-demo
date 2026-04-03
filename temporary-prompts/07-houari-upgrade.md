# DAY: 2026-04-03

## 14:14

```
 cat package.json | grep -A 999 '"dependencies"' | grep -B 999 '}'
   "dependencies": {
    "@angular/animations": "^8.2.4",
    "@angular/common": "~8.2.0",
    "@angular/compiler": "~8.2.0",
    "@angular/core": "~8.2.0",
    "@angular/forms": "~8.2.0",
    "@angular/platform-browser": "~8.2.0",
    "@angular/platform-browser-dynamic": "~8.2.0",
    "@angular/router": "~8.2.0",
    "angular-font-awesome": "^3.1.2",
    "bootstrap": "^4.3.1",
    "font-awesome": "^4.7.0",
    "ngx-bootstrap": "^5.1.1",
    "ngx-toastr": "^10.2.0",
    "rxjs": "^6.4.0",
    "tslib": "^1.10.0",
    "zone.js": "~0.9.1"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "~0.802.0",
    "@angular/cli": "~8.2.0",
    "@angular/compiler-cli": "~8.2.0",
    "@angular/language-service": "~8.2.0",
    "@types/node": "~8.9.4",
    "@types/jasmine": "~3.3.8",
    "@types/jasminewd2": "~2.0.3",
    "codelyzer": "^5.0.0",
    "jasmine-core": "~3.4.0",
    "jasmine-spec-reporter": "~4.2.1",
    "karma": "~6.3.16",
    "karma-chrome-launcher": "~2.2.0",
    "karma-coverage-istanbul-reporter": "~2.0.1",
    "karma-jasmine": "~2.0.1",
    "karma-jasmine-html-reporter": "^1.4.0",
    "protractor": "~5.4.0",
    "ts-node": "~7.0.0",
    "tslint": "~5.15.0",
    "typescript": "~3.5.3"
  }
}
```

```
 npm ls --depth=0
 crm-frontend@0.0.0 /Users/edburns/workareas/dd-2844946-demo-00/HouariZegai-FullStack-Angular-SpringBoot/crm-frontend
├── @angular-devkit/build-angular@0.802.2
├── @angular/animations@8.2.14
├── @angular/cli@8.2.2
├── @angular/common@8.2.14
├── @angular/compiler-cli@8.2.14
├── @angular/compiler@8.2.14
├── @angular/core@8.2.14
├── @angular/forms@8.2.14
├── @angular/language-service@8.2.14
├── @angular/platform-browser-dynamic@8.2.14
├── @angular/platform-browser@8.2.14
├── @angular/router@8.2.14
├── @types/jasmine@3.3.16
├── @types/jasminewd2@2.0.13
├── @types/node@8.9.5
├── angular-font-awesome@3.1.2
├── bindings@1.5.0 extraneous
├── bootstrap@4.6.2
├── codelyzer@5.2.2
├── file-uri-to-path@1.0.0 extraneous
├── font-awesome@4.7.0
├── jasmine-core@3.4.0
├── jasmine-spec-reporter@4.2.1
├── karma-chrome-launcher@2.2.0
├── karma-coverage-istanbul-reporter@2.0.6
├── karma-jasmine-html-reporter@1.7.0
├── karma-jasmine@2.0.1
├── karma@6.3.20
├── nan@2.26.2 extraneous
├── ngx-bootstrap@5.6.2
├── ngx-toastr@10.2.0
├── protractor@5.4.4
├── rxjs@6.6.7
├── ts-node@7.0.1
├── tslib@1.14.1
├── tslint@5.15.0
├── typescript@3.5.3
└── zone.js@0.9.1

```

`07-houari-upgrade-npm-audit.md `

```
Package                            Current   Wanted  Latest  Location                                        Depended by
@angular-devkit/build-angular      0.802.2  0.802.2  21.2.6  node_modules/@angular-devkit/build-angular      crm-frontend
@angular/animations                 8.2.14   8.2.14  21.2.7  node_modules/@angular/animations                crm-frontend
@angular/cli                         8.2.2    8.2.2  21.2.6  node_modules/@angular/cli                       crm-frontend
@angular/common                     8.2.14   8.2.14  21.2.7  node_modules/@angular/common                    crm-frontend
@angular/compiler                   8.2.14   8.2.14  21.2.7  node_modules/@angular/compiler                  crm-frontend
@angular/compiler-cli               8.2.14   8.2.14  21.2.7  node_modules/@angular/compiler-cli              crm-frontend
@angular/core                       8.2.14   8.2.14  21.2.7  node_modules/@angular/core                      crm-frontend
@angular/forms                      8.2.14   8.2.14  21.2.7  node_modules/@angular/forms                     crm-frontend
@angular/language-service           8.2.14   8.2.14  21.2.7  node_modules/@angular/language-service          crm-frontend
@angular/platform-browser           8.2.14   8.2.14  21.2.7  node_modules/@angular/platform-browser          crm-frontend
@angular/platform-browser-dynamic   8.2.14   8.2.14  21.2.7  node_modules/@angular/platform-browser-dynamic  crm-frontend
@angular/router                     8.2.14   8.2.14  21.2.7  node_modules/@angular/router                    crm-frontend
@types/jasmine                      3.3.16   3.3.16   6.0.0  node_modules/@types/jasmine                     crm-frontend
@types/node                          8.9.5    8.9.5  25.5.2  node_modules/@types/node                        crm-frontend
bootstrap                            4.6.2    4.6.2   5.3.8  node_modules/bootstrap                          crm-frontend
codelyzer                            5.2.2    5.2.2   6.0.2  node_modules/codelyzer                          crm-frontend
jasmine-core                         3.4.0    3.4.0   6.1.0  node_modules/jasmine-core                       crm-frontend
jasmine-spec-reporter                4.2.1    4.2.1   7.0.0  node_modules/jasmine-spec-reporter              crm-frontend
karma                               6.3.20   6.3.20   6.4.4  node_modules/karma                              crm-frontend
karma-chrome-launcher                2.2.0    2.2.0   3.2.0  node_modules/karma-chrome-launcher              crm-frontend
karma-coverage-istanbul-reporter     2.0.6    2.0.6   3.0.3  node_modules/karma-coverage-istanbul-reporter   crm-frontend
karma-jasmine                        2.0.1    2.0.1   5.1.0  node_modules/karma-jasmine                      crm-frontend
karma-jasmine-html-reporter          1.7.0    1.7.0   2.2.0  node_modules/karma-jasmine-html-reporter        crm-frontend
ngx-bootstrap                        5.6.2    5.6.2  21.0.1  node_modules/ngx-bootstrap                      crm-frontend
ngx-toastr                          10.2.0   10.2.0  20.0.5  node_modules/ngx-toastr                         crm-frontend
protractor                           5.4.4    5.4.4   7.0.0  node_modules/protractor                         crm-frontend
rxjs                                 6.6.7    6.6.7   7.8.2  node_modules/rxjs                               crm-frontend
ts-node                              7.0.1    7.0.1  10.9.2  node_modules/ts-node                            crm-frontend
tslib                               1.14.1   1.14.1   2.8.1  node_modules/tslib                              crm-frontend
tslint                              5.15.0   5.15.0  5.20.1  node_modules/tslint                             crm-frontend
typescript                           3.5.3    3.5.3   6.0.2  node_modules/typescript                         crm-frontend
zone.js                              0.9.1    0.9.1  0.16.1  node_modules/zone.js                            crm-frontend
```
