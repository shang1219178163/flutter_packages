# DDLog
  
```dart
[DateTime.now()][Type][System][className.funcName Line:lineNumber]: ...
```

## example
```dart
void onTest() {
  try {
    var map = {};
    jsonDecode(map["a"]);
  } catch (e) {
    debugPrint("$this $e");//flutter: _MetaDataDemoState#d5486 type 'Null' is not a subtype of type 'String'
    DLog.d("$e");//[log] [2025-03-27 10:13:00.725182][DEBUG][ios][_MetaDataDemoState.onTest Line:161]: type 'Null' is not a subtype of type 'String'
    DLog.i("$e");//[log] [2025-03-27 10:13:00.725901][INFO][ios][_MetaDataDemoState.onTest Line:162]: type 'Null' is not a subtype of type 'String'
    DLog.w("$e");//[log] [2025-03-27 10:13:00.726502][WARN][ios][_MetaDataDemoState.onTest Line:163]: type 'Null' is not a subtype of type 'String'
    DLog.e("$e");//[log] [2025-03-27 10:13:00.727041][ERROR][ios][_MetaDataDemoState.onTest Line:164]: type 'Null' is not a subtype of type 'String'
  }
}
```

`关闭颜色(andriod studio 不支持) `
```dart
DLog.enableColor = false;
```
![](https://raw.githubusercontent.com/shang1219178163/ddlog/refs/heads/develop/example/assets/images/andriodStudio_screenshot.webp)

`打开颜色(VSCode支持)`
```dart
DLog.enableColor = true;
```
![](https://github.com/shang1219178163/ddlog/blob/develop/example/assets/images/vscode_screenshot.png?raw=true)

## Getting Started

```
dependencies:
  flutter:
    sdk: flutter

  ddlog: ^1.0.1

```
