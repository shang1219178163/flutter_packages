# align_overlay
A pop-up window that supports appearing in any direction, it is popup, sheet, dialog, alert, drawer, popup...

## Getting started

```yaml
dependencies:
  align_overlay: ^1.0.0
```

## Usage


## 1、AlignPopupRoute

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

  Widget buildPopupView({required Alignment alignment, Map<String, dynamic>? argsDismiss}) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 300,
        height: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(argsDismiss);
          },
          child: Text("dismiss"),
        ),
      ),
    );
  }
```


![](https://github.com/shang1219178163/flutter_packages/blob/main/packages/align_overlay/example/assets/images/image_merge_horizontal_20260805_102957.webp?raw=true)

![](https://github.com/shang1219178163/flutter_packages/blob/main/packages/align_overlay/example/assets/images/image_merge_horizontal_20260805_103048.webp?raw=true)

![](https://github.com/shang1219178163/flutter_packages/blob/main/packages/align_overlay/example/assets/images/image_merge_horizontal_20260805_103114.webp?raw=true)

![](https://github.com/shang1219178163/flutter_packages/blob/main/packages/align_overlay/example/assets/images/image_merge_horizontal_20260805_104933.webp?raw=true)


## 2、AlignOverlayDialog

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
