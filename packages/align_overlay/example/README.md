# align_overlay example

Demo app for [align_overlay](https://pub.dev/packages/align_overlay) — popups, sheets, drawers, toasts, and loading overlays aligned in any direction.

## Getting started

```bash
cd packages/align_overlay/example
flutter run
```

```yaml
dependencies:
  align_overlay: ^1.0.1
```

## Usage

### 1. AlignPopupRoute

```dart
import 'package:align_overlay/align_overlay.dart';
```

```dart
Future<void> onPopupRoute() async {
  final route = AlignPopupRoute(
    from: alignment,
    builder: (_) {
      return buildPopupView(alignment: alignment, argsDismiss: {"b": "88"});
    },
  );
  final result = await Navigator.of(context).push(route);
  debugPrint(["result", result.runtimeType, result]);
}

Widget buildPopupView({
  required Alignment alignment,
  Map<String, dynamic>? argsDismiss,
}) {
  return Align(
    alignment: alignment,
    child: Container(
      width: 300,
      height: 400,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(color: Colors.blue),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(argsDismiss);
        },
        child: const Text("dismiss"),
      ),
    ),
  );
}
```

#### Screenshots

Home:

<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/home.png" width="30%" alt="Home">
</p>

Popup / OverlayEntry alignments:

<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_top_left.png" width="30%" alt="Alignment.topLeft">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_top_center.png" width="30%" alt="Alignment.topCenter">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_top_right.png" width="30%" alt="Alignment.topRight">
</p>
<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_center_left.png" width="30%" alt="Alignment.centerLeft">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_center.png" width="30%" alt="Alignment.center">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_center_right.png" width="30%" alt="Alignment.centerRight">
</p>
<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_bottom_left.png" width="30%" alt="Alignment.bottomLeft">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_bottom_center.png" width="30%" alt="Alignment.bottomCenter">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/align_bottom_right.png" width="30%" alt="Alignment.bottomRight">
</p>

### 2. AlignOverlayDialog

```dart
import 'package:align_overlay/align_overlay.dart';
```

```dart
AlignOverlayDialog.show(
  context,
  from: v,
  barrierColor: Colors.black12,
  // barrierDismissible: false,
  onBarrier: () {
    debugPrint('AlignOverlayDialog onBarrier');
  },
  child: Container(
    width: 300,
    height: 300,
    child: buildContent(
      title: v.toString(),
      onTap: () {
        AlignOverlayDialog.dismiss();
        debugPrint('AlignOverlayDialog onBarrier');
      },
    ),
  ),
);
```

#### sheet

```dart
AlignOverlayDialog.sheet(
  context,
  child: buildContent(
    height: 400,
    margin: EdgeInsets.symmetric(horizontal: 30),
    onTap: () {
      AlignOverlayDialog.dismiss();
    },
  ),
);
```

#### toast

```dart
AlignOverlayDialog.toast(
  context,
  hideBarrier: true,
  from: Alignment.center,
  message: "This is a Toast!",
);
```

#### Screenshots

<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/dialog_sheet.png" width="30%" alt="AlignOverlayDialog.sheet">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/dialog_drawer.png" width="30%" alt="AlignOverlayDialog.drawer">
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/dialog_toast.png" width="30%" alt="AlignOverlayDialog.toast">
</p>
<p>
<img src="https://raw.githubusercontent.com/shang1219178163/flutter_packages/main/packages/align_overlay/example/screenshots/dialog_loading.png" width="30%" alt="AlignOverlayDialog.loading">
</p>
