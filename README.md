# flutter_packages

Flutter packages monorepo using Dart [pub workspaces](https://dart.dev/tools/pub/workspaces), with [Melos](https://melos.invertase.dev/) for scripts.

```text
flutter_packages/
├── apps/
│   └── example/                          # Demo app
├── packages/
│   ├── align_overlay/                    # Alignment-driven overlay / sheet / drawer
│   ├── ddlog/                            # Logging helpers
│   ├── enhance_expansion_panel/          # Enhanced ExpansionPanel
│   ├── enhance_stepper/                  # Enhanced Stepper
│   ├── enhance_widget/                   # Aggregated En* widgets
│   │   ├── EnExpansionPanel / List / Tile / ExpandListView
│   │   ├── EnStepper / EnStep
│   │   ├── EnBottomNavigationBar
│   │   ├── EnBoxDecoration
│   │   └── EnDecorationImage
│   ├── route_stack_manager/              # Route stack listener
│   └── tap_track/                        # Tap-event global tracking
│       └── example/                      # Each package keeps its own example/
├── melos.yaml
└── pubspec.yaml                          # Workspace root
```

## Setup

```bash
dart pub get
# 或
dart run melos run get
```

> Melos 6 + Dart workspaces 请用 `dart pub get`，不要用 `melos bootstrap`
> （会生成 `pubspec_overrides.yaml`，与 `resolution: workspace` 冲突）。

## 常用命令

```bash
# 依赖
dart pub get                          # 解析 workspace 依赖
dart run melos run get                # 同上（melos 脚本）

# 质量检查
dart run melos run analyze            # 全仓库 flutter analyze
dart run melos run test               # 全仓库 flutter test

# 单独跑某个包
cd packages/ddlog && flutter test
cd packages/tap_track && flutter test
cd packages/enhance_stepper && flutter test
cd apps/example && flutter test

# 运行 example 应用
cd apps/example && flutter run
cd packages/align_overlay/example && flutter run
cd packages/ddlog/example && flutter run
cd packages/tap_track/example && flutter run
cd packages/route_stack_manager/example && flutter run
cd packages/enhance_expansion_panel/example && flutter run
cd packages/enhance_stepper/example && flutter run
cd packages/enhance_widget/example && flutter run

# 列出 workspace 包
dart run melos list
```

## 发布到 pub.dev

推送匹配规则的 git tag 会触发 `.github/workflows/*_publish.yml`，自动发布对应包。

发布前请确认：

1. `packages/<name>/pubspec.yaml` 的 `version` 已更新
2. `CHANGELOG.md` 已包含该版本说明
3. 已去掉 `publish_to: none`（如有）

```bash
# 格式：<package>-v<semver>
git tag align_overlay-v1.0.0
git tag ddlog-v1.1.0
git tag enhance_expansion_panel-v2.0.0
git tag enhance_stepper-v2.0.0
git tag enhance_widget-v1.0.0
git tag route_stack_manager-v1.3.0
git tag tap_track-v1.0.0

# 推送单个 tag 触发对应 workflow
git push origin align_overlay-v1.0.0

# 或一次推送多个 tag
git push origin --tags
```

| Package                   | Tag 示例                         | Workflow                              | pub.dev                                                  |
| ------------------------- | -------------------------------- | ------------------------------------- | -------------------------------------------------------- |
| `align_overlay`           | `align_overlay-v1.0.0`           | `align_overlay_publish.yml`           | [link](https://pub.dev/packages/align_overlay)           |
| `ddlog`                   | `ddlog-v1.1.0`                   | `ddlog_publish.yml`                   | [link](https://pub.dev/packages/ddlog)                   |
| `enhance_expansion_panel` | `enhance_expansion_panel-v2.0.0` | `enhance_expansion_panel_publish.yml` | [link](https://pub.dev/packages/enhance_expansion_panel) |
| `enhance_stepper`         | `enhance_stepper-v2.0.0`         | `enhance_stepper_publish.yml`         | [link](https://pub.dev/packages/enhance_stepper)         |
| `enhance_widget`          | `enhance_widget-v1.0.0`          | `enhance_widget_publish.yml`          | [link](https://pub.dev/packages/enhance_widget)          |
| `route_stack_manager`     | `route_stack_manager-v1.3.0`     | `route_stack_manager_publish.yml`     | [link](https://pub.dev/packages/route_stack_manager)     |
| `tap_track`               | `tap_track-v1.0.0`               | `tap_track_publish.yml`               | [link](https://pub.dev/packages/tap_track)               |

## 新增 package

```bash
flutter create --template=package packages/<name>
```

然后：

1. 在根目录 `pubspec.yaml` 的 `workspace:` 中加入 `packages/<name>`（有 example 时一并加入 `packages/<name>/example`）
2. 在新包的 `pubspec.yaml` 中加入 `resolution: workspace`
3. example 包名建议用 `<name>_example`，避免与其它 example 冲突
4. 在仓库根目录执行 `dart pub get`
