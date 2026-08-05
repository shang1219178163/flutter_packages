# enhance_widget

[![pub](https://img.shields.io/pub/v/enhance_widget.svg)](https://pub.dev/packages/enhance_widget)

Enhanced Flutter widgets under a unified `En*` API — drop-in upgrades over Material counterparts with the extras you actually need in production apps.

| Widget | Enhances | Highlights |
| --- | --- | --- |
| `EnExpansionPanelList` / `EnExpansionPanel` / `EnExpansionTile` / `EnExpandListView` | ExpansionPanel / ExpansionTile | Custom / hide arrow, leading·tailing·none, custom header slots |
| `EnStepper` / `EnStep` | Stepper | Horizontal title / line positions, custom step icons |
| `EnBottomNavigationBar` | BottomNavigationBar | `onDoubleTap`, `tileBuilder` |
| `EnBoxDecoration` | BoxDecoration | `innerBoxShadow` |
| `EnDecorationImage` | DecorationImage | `placeholder`, `destinationOffset` |

## Screenshots

<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/enhance_widget/screenshot/en_expansion_panel.png" width="30%" alt="EnExpansionPanel">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/enhance_widget/screenshot/en_stepper.png" width="30%" alt="EnStepper">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/enhance_widget/screenshot/en_bottom_navigation_bar.png" width="30%" alt="EnBottomNavigationBar">
</p>
<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/enhance_widget/screenshot/en_box_decoration.png" width="30%" alt="EnBoxDecoration">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/enhance_widget/screenshot/en_decoration_image.png" width="30%" alt="EnDecorationImage">
</p>

## Getting started

```yaml
dependencies:
  enhance_widget: ^1.0.0
```

```dart
import 'package:enhance_widget/enhance_widget.dart';
```

Run the example app for interactive demos of every widget:

```bash
cd packages/enhance_widget/example
flutter run
```

## Usage

### Expansion panel / tile

Hide or customize the expand arrow, and place it on either side:

```dart
EnExpansionPanelList(
  expansionCallback: (index, isExpanded) {
    setState(() => items[index].isExpanded = !isExpanded);
  },
  children: [
    EnExpansionPanel(
      isExpanded: items[0].isExpanded,
      canTapOnHeader: true,
      arrowColor: Colors.blue,
      arrowPosition: EnExpansionPanelArrowPosition.tailing, // leading | tailing | none
      arrow: const Icon(Icons.keyboard_arrow_right),
      arrowExpanded: const Icon(Icons.keyboard_arrow_down),
      headerBuilder: (context, isExpanded) {
        return ListTile(title: Text(items[0].title));
      },
      body: const ListTile(title: Text('Body')),
    ),
  ],
);
```

`EnExpansionTile` adds optional `header` / `childrenHeader` / `childrenFooter` builders for richer expand layouts. Prefer `EnExpandListView` when binding a typed list of expand sections.

### Stepper

Horizontal steppers can put titles under the circles and tune the connector line:

```dart
EnStepper(
  type: StepperType.horizontal,
  currentStep: index,
  horizontalTitlePosition: HorizontalTitlePosition.bottom, // inline | bottom
  horizontalLinePosition: HorizontalLinePosition.top, // center | top
  onStepTapped: (i) => setState(() => index = i),
  steps: [
    EnStep(
      icon: const Icon(Icons.looks_one),
      title: const Text('Account'),
      content: const Text('Step body'),
      isActive: index >= 0,
    ),
    EnStep(
      title: const Text('Confirm'),
      content: const Text('Step body'),
      isActive: index >= 1,
    ),
  ],
);
```

### Bottom navigation bar

Same API as `BottomNavigationBar`, plus double-tap and per-tile composition:

```dart
EnBottomNavigationBar(
  currentIndex: index,
  onTap: (i) => setState(() => index = i),
  onDoubleTap: (i) {
    // e.g. scroll to top / refresh tab
  },
  tileBuilder: (i, selected, icon, label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [icon, label],
    );
  },
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  ],
);
```

### Box decoration (inner shadow)

```dart
Container(
  decoration: EnBoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    innerBoxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.12),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: const SizedBox(height: 80, width: 160),
);
```

### Decoration image (placeholder / offset)

```dart
Container(
  decoration: BoxDecoration(
    image: EnDecorationImage(
      image: const NetworkImage('https://example.com/photo.jpg'),
      placeholder: const AssetImage('assets/images/img_placeholder.png'),
      fit: BoxFit.cover,
      destinationOffset: const Offset(0, -12),
    ),
  ),
);
```

## Related packages

Standalone packages with the same core ideas (kept for existing dependents):

- [enhance_expansion_panel](https://pub.dev/packages/enhance_expansion_panel)
- [enhance_stepper](https://pub.dev/packages/enhance_stepper)

Prefer **enhance_widget** for new projects that need several of these widgets under one dependency.

## Additional information

- Source: [flutter_packages / enhance_widget](https://github.com/shang1219178163/flutter_packages/tree/main/packages/enhance_widget)
- Issues / PRs: [flutter_packages](https://github.com/shang1219178163/flutter_packages)
- License: see `LICENSE`
