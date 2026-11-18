# CHANGELOG

工作区级变更记录（各包自己的变更见 `packages/<name>/CHANGELOG.md`）。

## 2026-11-18 09:39

* 修正 `route_stack_manager`、`tap_track` 的 `homepage` 字段：原值指向不存在的独立仓库（`shang1219178163/route_stack_manager`、`shang1219178163/tap_track`），改为 monorepo 路径。
* 为上述两个包补充 `repository` 字段，与其他包保持一致。
* 发布 `route_stack_manager` 1.3.1、`tap_track` 1.0.1（tag：`route_stack_manager-v1.3.1`、`tap_track-v1.0.1`）。
