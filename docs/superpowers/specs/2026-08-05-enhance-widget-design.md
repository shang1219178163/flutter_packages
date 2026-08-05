# enhance_widget design

Date: 2026-08-05

## Goal

Aggregate enhanced Flutter widgets under `packages/enhance_widget` with a unified `En*` API. Do not modify `enhance_expansion_panel` or `enhance_stepper` packages.

## Scope (approved)

1. Only the five groups already under `lib/src`:
   - `en_expansion_panel`
   - `en_stepper`
   - `en_bottom_navigation_bar`
   - `en_box_decoration`
   - `en_decoration_image`
2. Naming: keep `En*` (not `Enhance*`).
3. Approach: copy/localize expansion + stepper from standalone packages into this package; fix imports/exports for the rest.
4. Example: home list + five demo pages.

## Non-goals

- Publishing to pub.dev in this iteration
- Migrating additional templet enhance widgets (dialog/sheet/tab/app_bar)
