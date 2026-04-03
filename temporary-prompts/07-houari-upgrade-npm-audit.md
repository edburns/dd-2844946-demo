# npm audit report

@angular/common  <=19.2.15
Severity: high
Depends on vulnerable versions of @angular/core
Angular is Vulnerable to XSRF Token Leakage via Protocol-Relative URLs in Angular HTTP Client - https://github.com/advisories/GHSA-58c5-g7wp-6w37
fix available via `npm audit fix --force`
Will install @angular/common@21.2.7, which is a breaking change
node_modules/@angular/common
  @angular/forms  <=19.2.15
  Depends on vulnerable versions of @angular/common
  Depends on vulnerable versions of @angular/core
  Depends on vulnerable versions of @angular/platform-browser
  node_modules/@angular/forms
  @angular/platform-browser  <=19.2.15
  Depends on vulnerable versions of @angular/common
  Depends on vulnerable versions of @angular/core
  node_modules/@angular/platform-browser
    ngx-toastr  <=8.1.0 || 8.5.1 - 10.2.0
    Depends on vulnerable versions of @angular/common
    Depends on vulnerable versions of @angular/core
    Depends on vulnerable versions of @angular/platform-browser
    node_modules/ngx-toastr
  @angular/platform-browser-dynamic  <=19.2.15
  Depends on vulnerable versions of @angular/common
  Depends on vulnerable versions of @angular/compiler
  Depends on vulnerable versions of @angular/core
  Depends on vulnerable versions of @angular/platform-browser
  node_modules/@angular/platform-browser-dynamic
  @angular/router  <=0.0.0-ROUTERPLACEHOLDER || 2.0.0-rc.0 - 19.2.15
  Depends on vulnerable versions of @angular/common
  Depends on vulnerable versions of @angular/core
  Depends on vulnerable versions of @angular/platform-browser
  node_modules/@angular/router

@angular/compiler  <=18.2.14
Severity: high
Angular Stored XSS Vulnerability via SVG Animation, SVG URL and MathML Attributes - https://github.com/advisories/GHSA-v4hv-rgfq-gp49
Angular has XSS Vulnerability via Unsanitized SVG Script Attributes - https://github.com/advisories/GHSA-jrmj-c5cx-3cw6
fix available via `npm audit fix --force`
Will install @angular/compiler@21.2.7, which is a breaking change
node_modules/@angular/compiler
  @angular/compiler-cli  <=18.2.14
  Depends on vulnerable versions of @angular/compiler
  Depends on vulnerable versions of chokidar
  node_modules/@angular/compiler-cli
    @angular-devkit/build-angular  <=20.3.18 || 21.0.0-next.0 - 21.2.0
    Depends on vulnerable versions of @angular-devkit/architect
    Depends on vulnerable versions of @angular-devkit/build-optimizer
    Depends on vulnerable versions of @angular-devkit/build-webpack
    Depends on vulnerable versions of @angular-devkit/core
    Depends on vulnerable versions of @angular/compiler-cli
    Depends on vulnerable versions of @ngtools/webpack
    Depends on vulnerable versions of ajv
    Depends on vulnerable versions of autoprefixer
    Depends on vulnerable versions of browserslist
    Depends on vulnerable versions of copy-webpack-plugin
    Depends on vulnerable versions of file-loader
    Depends on vulnerable versions of istanbul-instrumenter-loader
    Depends on vulnerable versions of less
    Depends on vulnerable versions of loader-utils
    Depends on vulnerable versions of mini-css-extract-plugin
    Depends on vulnerable versions of minimatch
    Depends on vulnerable versions of postcss
    Depends on vulnerable versions of postcss-import
    Depends on vulnerable versions of postcss-loader
    Depends on vulnerable versions of raw-loader
    Depends on vulnerable versions of semver
    Depends on vulnerable versions of terser-webpack-plugin
    Depends on vulnerable versions of tree-kill
    Depends on vulnerable versions of webpack
    Depends on vulnerable versions of webpack-dev-middleware
    Depends on vulnerable versions of webpack-dev-server
    node_modules/@angular-devkit/build-angular
    @ngtools/webpack  <=1.2.13 || 6.0.0-beta.2 - 18.2.21
    Depends on vulnerable versions of @angular-devkit/core
    Depends on vulnerable versions of @angular/compiler-cli
    Depends on vulnerable versions of tree-kill
    Depends on vulnerable versions of webpack
    node_modules/@ngtools/webpack
  codelyzer  >=1.0.0-beta.0
  Depends on vulnerable versions of @angular/compiler
  Depends on vulnerable versions of @angular/core
  node_modules/codelyzer

@angular/core  <=18.2.14
Severity: high
Angular vulnerable to Cross-site Scripting - https://github.com/advisories/GHSA-c75v-2vq8-878f
Angular has XSS Vulnerability via Unsanitized SVG Script Attributes - https://github.com/advisories/GHSA-jrmj-c5cx-3cw6
Angular i18n vulnerable to Cross-Site Scripting - https://github.com/advisories/GHSA-prjf-86w9-mfqv
fix available via `npm audit fix --force`
Will install @angular/core@21.2.7, which is a breaking change
node_modules/@angular/core
  @angular/animations  <=18.2.14
  Depends on vulnerable versions of @angular/core
  node_modules/@angular/animations

ajv  <=6.12.6
Severity: moderate
Prototype Pollution in Ajv - https://github.com/advisories/GHSA-v88g-cgmw-v5xw
ajv has ReDoS when using `$data` option - https://github.com/advisories/GHSA-2g4f-4pwh-qvx6
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/ajv
node_modules/istanbul-instrumenter-loader/node_modules/ajv
  @angular-devkit/core  0.0.24 - 12.0.0-rc.3
  Depends on vulnerable versions of ajv
  node_modules/@angular-devkit/core
    @angular-devkit/architect  <=0.1200.0-rc.3
    Depends on vulnerable versions of @angular-devkit/core
    node_modules/@angular-devkit/architect
      @angular/cli  <=1.4.0-rc.2 || 1.5.6 || 1.6.4 - 20.3.14 || 21.0.0-next.0 - 21.0.0-rc.6
      Depends on vulnerable versions of @angular-devkit/architect
      Depends on vulnerable versions of @angular-devkit/core
      Depends on vulnerable versions of @angular-devkit/schematics
      Depends on vulnerable versions of @schematics/angular
      Depends on vulnerable versions of @schematics/update
      Depends on vulnerable versions of ini
      Depends on vulnerable versions of inquirer
      Depends on vulnerable versions of pacote
      Depends on vulnerable versions of semver
      Depends on vulnerable versions of universal-analytics
      node_modules/@angular/cli
    @angular-devkit/build-webpack  <=0.1703.17
    Depends on vulnerable versions of @angular-devkit/architect
    Depends on vulnerable versions of @angular-devkit/core
    Depends on vulnerable versions of webpack
    Depends on vulnerable versions of webpack-dev-server
    node_modules/@angular-devkit/build-webpack
    @angular-devkit/schematics  0.0.43 - 12.0.0-rc.3
    Depends on vulnerable versions of @angular-devkit/core
    node_modules/@angular-devkit/schematics
    @schematics/angular  0.1.12 - 12.0.0-rc.3
    Depends on vulnerable versions of @angular-devkit/core
    Depends on vulnerable versions of @angular-devkit/schematics
    node_modules/@schematics/angular
    @schematics/update  *
    Depends on vulnerable versions of @angular-devkit/core
    Depends on vulnerable versions of @angular-devkit/schematics
    Depends on vulnerable versions of ini
    Depends on vulnerable versions of pacote
    Depends on vulnerable versions of semver
    node_modules/@schematics/update
  schema-utils  <=0.4.3
  Depends on vulnerable versions of ajv
  node_modules/istanbul-instrumenter-loader/node_modules/schema-utils
    istanbul-instrumenter-loader  >=1.0.0
    Depends on vulnerable versions of istanbul-lib-instrument
    Depends on vulnerable versions of schema-utils
    node_modules/istanbul-instrumenter-loader

ansi-html  <0.0.8
Severity: high
Uncontrolled Resource Consumption in ansi-html - https://github.com/advisories/GHSA-whgm-jr23-g3j9
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/ansi-html
  webpack-dev-server  <=5.2.0
  Depends on vulnerable versions of ansi-html
  Depends on vulnerable versions of chokidar
  Depends on vulnerable versions of http-proxy-middleware
  Depends on vulnerable versions of ip
  Depends on vulnerable versions of selfsigned
  Depends on vulnerable versions of sockjs
  Depends on vulnerable versions of webpack
  Depends on vulnerable versions of webpack-dev-middleware
  Depends on vulnerable versions of yargs
  node_modules/webpack-dev-server

babel-traverse  *
Severity: critical
Babel vulnerable to arbitrary code execution when compiling specifically crafted malicious code - https://github.com/advisories/GHSA-67hx-6x53-jw92
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/babel-traverse
  babel-template  *
  Depends on vulnerable versions of babel-traverse
  node_modules/babel-template
  istanbul-lib-instrument  <=1.10.2
  Depends on vulnerable versions of babel-template
  Depends on vulnerable versions of babel-traverse
  node_modules/istanbul-lib-instrument

braces  <3.0.3
Severity: high
Uncontrolled resource consumption in braces - https://github.com/advisories/GHSA-grv7-fg5c-xmjg
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/braces
  chokidar  1.3.0 - 2.1.8
  Depends on vulnerable versions of anymatch
  Depends on vulnerable versions of braces
  Depends on vulnerable versions of readdirp
  node_modules/chokidar
    watchpack-chokidar2  *
    Depends on vulnerable versions of chokidar
    node_modules/watchpack-chokidar2
      watchpack  1.7.2 - 1.7.5
      Depends on vulnerable versions of watchpack-chokidar2
      node_modules/watchpack
  micromatch  <=4.0.7
  Depends on vulnerable versions of braces
  node_modules/micromatch
    anymatch  1.2.0 - 2.0.0
    Depends on vulnerable versions of micromatch
    node_modules/anymatch
    http-proxy-middleware  <=2.0.7-beta.1
    Depends on vulnerable versions of micromatch
    node_modules/http-proxy-middleware
    readdirp  2.2.0 - 2.2.1
    Depends on vulnerable versions of micromatch
    node_modules/readdirp
    webpack  2.0.0-beta - 5.1.0
    Depends on vulnerable versions of micromatch
    Depends on vulnerable versions of node-libs-browser
    Depends on vulnerable versions of terser-webpack-plugin
    node_modules/webpack
      copy-webpack-plugin  4.3.0 - 13.0.1
      Depends on vulnerable versions of serialize-javascript
      Depends on vulnerable versions of webpack
      node_modules/copy-webpack-plugin
      file-loader  3.0.0 - 4.3.0
      Depends on vulnerable versions of webpack
      node_modules/file-loader
      mini-css-extract-plugin  <=0.9.0
      Depends on vulnerable versions of webpack
      node_modules/mini-css-extract-plugin
      raw-loader  1.0.0-beta.0 - 3.1.0
      Depends on vulnerable versions of webpack
      node_modules/raw-loader
      terser-webpack-plugin  <=5.3.16
      Depends on vulnerable versions of serialize-javascript
      Depends on vulnerable versions of webpack
      node_modules/terser-webpack-plugin
      webpack-dev-middleware  <=5.3.3
      Depends on vulnerable versions of webpack
      node_modules/webpack-dev-middleware

browserslist  4.0.0 - 4.16.4
Severity: moderate
Regular Expression Denial of Service in browserslist - https://github.com/advisories/GHSA-w8qv-6jwh-64r5
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/browserslist

elliptic  *
Elliptic Uses a Cryptographic Primitive with a Risky Implementation - https://github.com/advisories/GHSA-848j-6mx2-7j84
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/elliptic
  browserify-sign  >=2.4.0
  Depends on vulnerable versions of elliptic
  node_modules/browserify-sign
    crypto-browserify  >=3.4.0
    Depends on vulnerable versions of browserify-sign
    Depends on vulnerable versions of create-ecdh
    node_modules/crypto-browserify
      node-libs-browser  0.4.2 || >=1.0.0
      Depends on vulnerable versions of crypto-browserify
      node_modules/node-libs-browser
  create-ecdh  *
  Depends on vulnerable versions of elliptic
  node_modules/create-ecdh

form-data  <2.5.4
Severity: critical
form-data uses unsafe random function in form-data for choosing boundary - https://github.com/advisories/GHSA-fjxv-7rqg-78g4
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/form-data
  request  *
  Depends on vulnerable versions of form-data
  Depends on vulnerable versions of qs
  Depends on vulnerable versions of tough-cookie
  node_modules/request
    less  1.4.0-b1 - 2.6.1 || 2.7.2 - 3.11.3
    Depends on vulnerable versions of request
    node_modules/less
    universal-analytics  <=0.4.23
    Depends on vulnerable versions of request
    node_modules/universal-analytics
    webdriver-manager  *
    Depends on vulnerable versions of request
    Depends on vulnerable versions of xml2js
    node_modules/webdriver-manager
      protractor  >=1.3.0
      Depends on vulnerable versions of selenium-webdriver
      Depends on vulnerable versions of webdriver-js-extender
      Depends on vulnerable versions of webdriver-manager
      Depends on vulnerable versions of yargs
      node_modules/protractor

http-cache-semantics  <4.1.1
Severity: high
http-cache-semantics vulnerable to Regular Expression Denial of Service - https://github.com/advisories/GHSA-rc47-6667-2j5j
fix available via `npm audit fix --force`
Will install @angular/cli@21.2.6, which is a breaking change
node_modules/http-cache-semantics
  make-fetch-happen  2.0.0 - 8.0.1
  Depends on vulnerable versions of http-cache-semantics
  Depends on vulnerable versions of socks-proxy-agent
  node_modules/make-fetch-happen
    npm-registry-fetch  0.0.1 - 5.0.1
    Depends on vulnerable versions of make-fetch-happen
    node_modules/npm-registry-fetch
      pacote  2.0.0 - 19.0.1 || 20.0.0 || 21.0.0
      Depends on vulnerable versions of make-fetch-happen
      Depends on vulnerable versions of npm-registry-fetch
      Depends on vulnerable versions of tar
      node_modules/pacote


ini  <1.3.6
Severity: high
ini before 1.3.6 vulnerable to Prototype Pollution via ini.parse - https://github.com/advisories/GHSA-qqgx-2p2h-9c37
fix available via `npm audit fix --force`
Will install @angular/cli@21.2.6, which is a breaking change
node_modules/ini

ip  *
Severity: high
ip SSRF improper categorization in isPublic - https://github.com/advisories/GHSA-2p57-rm9w-gvfp
NPM IP package incorrectly identifies some private IP addresses as public - https://github.com/advisories/GHSA-78xj-cgh5-2h22
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/ip
  socks  1.0.0 - 2.7.1
  Depends on vulnerable versions of ip
  node_modules/socks
    socks-proxy-agent  1.0.1 - 4.0.2
    Depends on vulnerable versions of socks
    node_modules/socks-proxy-agent

loader-utils  <=1.4.1
Severity: critical
Prototype pollution in webpack loader-utils - https://github.com/advisories/GHSA-76p3-8jx3-jpfq
loader-utils is vulnerable to Regular Expression Denial of Service (ReDoS) via url variable - https://github.com/advisories/GHSA-3rfm-jhwj-7488
loader-utils is vulnerable to Regular Expression Denial of Service (ReDoS) - https://github.com/advisories/GHSA-hhq3-ff78-jv3g
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/loader-utils
  @angular-devkit/build-optimizer  0.8.8 - 0.901.0-rc.0
  Depends on vulnerable versions of loader-utils
  node_modules/@angular-devkit/build-optimizer


minimatch  <=3.1.3
Severity: high
minimatch ReDoS vulnerability - https://github.com/advisories/GHSA-f8q6-p94x-37v3
minimatch has a ReDoS via repeated wildcards with non-matching literal in pattern - https://github.com/advisories/GHSA-3ppc-4f35-3m26
minimatch has ReDoS: matchOne() combinatorial backtracking via multiple non-adjacent GLOBSTAR segments - https://github.com/advisories/GHSA-7r86-cg39-jmmj
minimatch ReDoS: nested *() extglobs generate catastrophically backtracking regular expressions - https://github.com/advisories/GHSA-23c5-xmqv-rm74
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/minimatch

node-forge  <=1.3.3
Severity: high
Prototype Pollution in node-forge debug API. - https://github.com/advisories/GHSA-5rrq-pxf6-6jx5
URL parsing in node-forge could lead to undesired behavior. - https://github.com/advisories/GHSA-gf8q-jrpm-jvxq
Improper Verification of Cryptographic Signature in `node-forge` - https://github.com/advisories/GHSA-2r2c-g63r-vccr
Open Redirect in node-forge - https://github.com/advisories/GHSA-8fr3-hfg3-gpgp
Improper Verification of Cryptographic Signature in node-forge - https://github.com/advisories/GHSA-x4jg-mjrx-434g
Improper Verification of Cryptographic Signature in node-forge - https://github.com/advisories/GHSA-cfm4-qjh2-4765
node-forge has ASN.1 Unbounded Recursion - https://github.com/advisories/GHSA-554w-wpv2-vw27
node-forge has an Interpretation Conflict vulnerability via its ASN.1 Validator Desynchronization - https://github.com/advisories/GHSA-5gfm-wpxj-wjgq
node-forge is vulnerable to ASN.1 OID Integer Truncation - https://github.com/advisories/GHSA-65ch-62r8-g69g
Forge has a basicConstraints bypass in its certificate chain verification (RFC 5280 violation) - https://github.com/advisories/GHSA-2328-f5f3-gj25
Forge has signature forgery in Ed25519 due to missing S > L check - https://github.com/advisories/GHSA-q67f-28xg-22rw
Forge has Denial of Service via Infinite Loop in BigInteger.modInverse() with Zero Input - https://github.com/advisories/GHSA-5m6q-g25r-mvwx
Forge has signature forgery in RSA-PKCS due to ASN.1 extra field   - https://github.com/advisories/GHSA-ppp5-5v6c-4jwp
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/node-forge
  selfsigned  1.1.1 - 1.10.14
  Depends on vulnerable versions of node-forge
  node_modules/selfsigned

postcss  <=8.4.30
Severity: moderate
Regular Expression Denial of Service in postcss - https://github.com/advisories/GHSA-hwj9-h5mp-3pm3
Regular Expression Denial of Service in postcss - https://github.com/advisories/GHSA-566m-qj78-rww5
PostCSS line return parsing error - https://github.com/advisories/GHSA-7fh5-64p2-3v2j
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/postcss
  autoprefixer  1.0.20131222 - 9.8.8
  Depends on vulnerable versions of postcss
  node_modules/autoprefixer
  postcss-import  <=12.0.1
  Depends on vulnerable versions of postcss
  node_modules/postcss-import
  postcss-loader  <=4.0.1
  Depends on vulnerable versions of postcss
  node_modules/postcss-loader

qs  <6.14.1
Severity: moderate
qs's arrayLimit bypass in its bracket notation allows DoS via memory exhaustion - https://github.com/advisories/GHSA-6rw7-vpxm-498p
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/request/node_modules/qs


semver  6.0.0 - 6.3.0
Severity: high
semver vulnerable to Regular Expression Denial of Service - https://github.com/advisories/GHSA-c2qf-rxjj-qqgw
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/semver

serialize-javascript  <=7.0.4
Severity: high
Cross-Site Scripting in serialize-javascript - https://github.com/advisories/GHSA-h9rv-jmmf-4pgx
Insecure serialization leading to RCE in serialize-javascript - https://github.com/advisories/GHSA-hxcc-f52p-wc94
Serialize JavaScript is Vulnerable to RCE via RegExp.flags and Date.prototype.toISOString() - https://github.com/advisories/GHSA-5c6j-r48x-rmvq
Serialize JavaScript has CPU Exhaustion Denial of Service via crafted array-like objects - https://github.com/advisories/GHSA-qj8w-gfj5-8c6v
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/serialize-javascript

sockjs  <0.3.20
Severity: moderate
Improper Input Validation in SocksJS-Node - https://github.com/advisories/GHSA-c9g6-9335-x697
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/sockjs

tar  <=7.5.10
Severity: high
Denial of service while parsing a tar file due to lack of folders count validation - https://github.com/advisories/GHSA-f5x3-32g6-xq36
node-tar Vulnerable to Arbitrary File Creation/Overwrite via Hardlink Path Traversal - https://github.com/advisories/GHSA-34x7-hfp2-rc4v
node-tar is Vulnerable to Arbitrary File Overwrite and Symlink Poisoning via Insufficient Path Sanitization - https://github.com/advisories/GHSA-8qq5-rm4j-mr97
Arbitrary File Read/Write via Hardlink Target Escape Through Symlink Chain in node-tar Extraction - https://github.com/advisories/GHSA-83g3-92jg-28cx
tar has Hardlink Path Traversal via Drive-Relative Linkpath - https://github.com/advisories/GHSA-qffp-2rhf-9h96
node-tar Symlink Path Traversal via Drive-Relative Linkpath - https://github.com/advisories/GHSA-9ppj-qmqm-q256
Race Condition in node-tar Path Reservations via Unicode Ligature Collisions on macOS APFS - https://github.com/advisories/GHSA-r6q2-hw4h-h46w
fix available via `npm audit fix --force`
Will install @angular/cli@21.2.6, which is a breaking change
node_modules/tar

tmp  <=0.2.3
tmp allows arbitrary temporary file / directory write via symbolic link `dir` parameter - https://github.com/advisories/GHSA-52f5-9888-hmc6
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/selenium-webdriver/node_modules/tmp
node_modules/tmp
  external-editor  >=1.1.1
  Depends on vulnerable versions of tmp
  node_modules/external-editor
    inquirer  3.0.0 - 8.2.6 || 9.0.0 - 9.3.7
    Depends on vulnerable versions of external-editor
    node_modules/inquirer
  selenium-webdriver  2.43.1 - 4.0.0-rc-2
  Depends on vulnerable versions of tmp
  Depends on vulnerable versions of xml2js
  node_modules/selenium-webdriver
    webdriver-js-extender  *
    Depends on vulnerable versions of selenium-webdriver
    node_modules/webdriver-js-extender

tough-cookie  <4.1.3
Severity: moderate
tough-cookie Prototype Pollution vulnerability - https://github.com/advisories/GHSA-72xf-g2v4-qvf3
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/tough-cookie

tree-kill  <=1.2.1
Severity: critical
Command Injection in tree-kill - https://github.com/advisories/GHSA-884p-74jh-xrg2
Treekill Enables OS Command Injection - https://github.com/advisories/GHSA-j7fq-p9q7-5wfv
fix available via `npm audit fix --force`
Will install @angular-devkit/build-angular@21.2.6, which is a breaking change
node_modules/tree-kill



xml2js  <0.5.0
Severity: moderate
xml2js is vulnerable to prototype pollution - https://github.com/advisories/GHSA-776f-qx25-q3cc
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/xml2js

yargs-parser  6.0.0 - 13.1.1
Severity: moderate
yargs-parser Vulnerable to Prototype Pollution - https://github.com/advisories/GHSA-p9pc-299p-vxgp
fix available via `npm audit fix --force`
Will install protractor@6.0.0, which is a breaking change
node_modules/protractor/node_modules/yargs-parser
node_modules/webpack-dev-server/node_modules/yargs-parser
  yargs  8.0.0-candidate.0 - 12.0.5
  Depends on vulnerable versions of yargs-parser
  node_modules/protractor/node_modules/yargs
  node_modules/webpack-dev-server/node_modules/yargs

87 vulnerabilities (9 low, 28 moderate, 42 high, 8 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues (including breaking changes), run:
  npm audit fix --force
