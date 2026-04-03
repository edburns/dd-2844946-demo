# Post-Upgrade Repair Prompt

Paste this into the GHCP App Modernization chat window after the upgrade completes.

---

The upgrade updated packages to Angular 21 and Bootstrap 5, but left two issues that prevent the app from running. Please fix both:

## 1. Fix `angular.json` for Angular 21

In `crm-frontend/angular.json`:

- Rename all occurrences of `"browserTarget"` to `"buildTarget"` (in the `serve` and `extract-i18n` architect sections). Angular 21 renamed this property and `ng serve` will fail with "must have required property 'buildTarget'" without this change.
- Remove `"aot": false` from `build.options`. Angular 21 requires AOT compilation and will fail with "buildOptimizer cannot be used without aot" if AOT is disabled.

## 2. Update `menu.component.html` for Bootstrap 5

In `crm-frontend/src/app/menu/menu.component.html`, the navbar uses Bootstrap 4 classes that don't render correctly with Bootstrap 5. Apply these changes:

- Replace `navbar-dark` with `data-bs-theme="dark"` on the `<nav>` element (`navbar-dark` is deprecated in Bootstrap 5.3 and nav links are invisible without this).
- Wrap the navbar contents in a `<div class="container-fluid">`.
- Add `class="nav-item"` to each `<li>` element.
- Remove the `navbar-collapse` class from the second `<ul>` (it hides the Login/Logout links in Bootstrap 5).
- Use `me-auto` on the first `<ul>` to push the right-side nav links to the end.
