This file contains AI and human generated demo notes.

Here are the commands a frontend developer would run from 
mehmetpekdemir-Todo-App/frontend/:

 # Show what's declared in package.json (the "requested" versions)
 cat package.json | grep -A 999 '"dependencies"' | grep -B 999 '}'

 # Show the actual installed versions (resolved from lock file / 
node_modules)
 npm ls --depth=0

 # Check for known security vulnerabilities
 npm audit

 # Show outdated packages (current vs wanted vs latest)
 npm outdated

Key things to note in this project:

 - react
  17.0.1 → upgradable to 18+/19+
 - axios
  0.21.1 → known CVEs, upgradable to 1.x
 - react-scripts
  4.0.2 → upgradable to 5.x
 - react-router-dom
  5.2.0 → upgradable to 6.x
 - bootstrap
  4.6.0 / reactstrap 8.9.0 → upgradable to Bootstrap 5
