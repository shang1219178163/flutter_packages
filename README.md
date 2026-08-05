# flutter_packages

Flutter packages monorepo using Dart [pub workspaces](https://dart.dev/tools/pub/workspaces), with [Melos](https://melos.invertase.dev/) for scripts.

```text
flutter_packages/
├── apps/
│   └── example/                          # Demo app
├── packages/
│   ├── ddlog/                            # Logging helpers
│   ├── enhance_expansion_panel/          # Enhanced ExpansionPanel
│   ├── enhance_stepper/                  # Enhanced Stepper
│   ├── n_slide_popup/                    # Slide popup / sheet / drawer
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
>（会生成 `pubspec_overrides.yaml`，与 `resolution: workspace` 冲突）。

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
cd packages/ddlog/example && flutter run
cd packages/tap_track/example && flutter run
cd packages/n_slide_popup/example && flutter run
cd packages/route_stack_manager/example && flutter run
cd packages/enhance_expansion_panel/example && flutter run
cd packages/enhance_stepper/example && flutter run

# 列出 workspace 包
dart run melos list
```

## 新增 package

```bash
flutter create --template=package packages/<name>
```

然后：

1. 在根目录 `pubspec.yaml` 的 `workspace:` 中加入 `packages/<name>`（有 example 时一并加入 `packages/<name>/example`）
2. 在新包的 `pubspec.yaml` 中加入 `resolution: workspace`
3. example 包名建议用 `<name>_example`，避免与其它 example 冲突
4. 在仓库根目录执行 `dart pub get`
