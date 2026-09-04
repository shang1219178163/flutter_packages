# animated_halo

[![pub](https://img.shields.io/pub/v/animated_halo.svg)](https://pub.dev/packages/animated_halo)

A Flutter widget that renders an animated pulsing halo ring.

The animation is recreated frame-by-frame from a 72×72, 60fps, 0–89 frame
reference: the inner ring keeps a fixed radius while its stroke thickens and
fades in, and the outer ring expands in sync while fading in and then out.

## Features

- Pulsing inner + outer halo rings.
- Inner ring fixed radius; outer ring radius animated.
- Content (`child`) clipped to a circle inside the inner ring.
- Fully configurable via constructor values.

## Getting started

```yaml
dependencies:
  animated_halo: ^1.0.0
```

```dart
import 'package:animated_halo/animated_halo.dart';
```

## Usage

```dart
AnimatedHalo(
  size: 72,
  color: const Color(0xFF51D3B1),
  innerColor: const Color(0xFF00B887),
  spacing: 6,
  strokeWidth: 2,
  innerStrokeWidth: 4,
  duration: const Duration(milliseconds: 1483),
    child: ClipOval(
    child: Image.network('https://example.com/avatar.jpg'),
  ),
)
```

<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/animated_halo/example/screenshots/halo_pulse.png" width="30%" alt="AnimatedHalo pulse preview">

### Parameters

| Param | Type | Default | Description |
| --- | --- | --- | --- |
| `size` | `double` | `72` | Canvas edge length. |
| `color` | `Color` | `0xFF51D3B1` | Outer ring stroke color. |
| `innerColor` | `Color` | `0xFF00B887` | Inner ring stroke color. |
| `spacing` | `double` | `6` | Outer-ring radius delta relative to the inner ring. |
| `strokeWidth` | `double` | `2` | Outer ring stroke width. |
| `innerStrokeWidth` | `double` | `4` | Inner ring stroke width. |
| `duration` | `Duration` | `1483ms` | Duration of one animation loop. |
| `child` | `Widget` | — | Content clipped to a circle inside the inner ring. |

## Example

Run the example app for live controls:

```bash
cd packages/animated_halo/example
flutter run
```

It lets you tweak `size`, `spacing`, `strokeWidth`, `innerStrokeWidth`, `duration`,
and the `child` image, plus outer/inner colors.

## Additional information

- Source: [flutter_packages / animated_halo](https://github.com/shang1219178163/flutter_packages/tree/main/packages/animated_halo)
- Issues / PRs: [flutter_packages](https://github.com/shang1219178163/flutter_packages)
- License: see `LICENSE`
