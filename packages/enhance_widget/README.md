# enhance_widget

[![pub](https://img.shields.io/pub/v/enhance_widget.svg)](https://pub.dev/packages/enhance_widget)

Collection of enhanced Flutter widgets with a unified `En*` API.

## Features

- **Expansion**: `EnExpansionPanelList`, `EnExpansionTile`, `EnExpandListView`
- **Stepper**: `EnStepper` / `EnStep` with alternate title/line positions
- **Bottom navigation**: `EnBottomNavigationBar` with `onDoubleTap` and `tileBuilder`
- **Decoration**: `EnBoxDecoration` (inner shadows) and `EnDecorationImage` (placeholder / offset)

## Getting started

```yaml
dependencies:
  enhance_widget: ^0.1.0
```

```dart
import 'package:enhance_widget/enhance_widget.dart';
```

## Usage

```dart
EnStepper(
  type: StepperType.horizontal,
  horizontalTitlePosition: HorizontalTitlePosition.bottom,
  steps: [
    EnStep(title: Text('Step 1'), content: Text('Content 1')),
  ],
);
```

See `example/` for demos of all widgets.

## Additional information

Issues and PRs: https://github.com/shang1219178163/flutter_packages
