# DDLog

Flutter 最简单好用的日志工具 / The simplest and most handy Flutter logging tool.

Output format / 输出格式:

```text
[DateTime.now()][Type][System][className.funcName Line:lineNumber]: ...
```

## Example / 示例

```dart
void onTest() {
  try {
    var map = {};
    jsonDecode(map["a"]);
  } catch (e) {
    debugPrint("$this $e");
    DLog.d("$e"); // DEBUG
    DLog.i("$e"); // INFO
    DLog.w("$e"); // WARN
    DLog.e("$e"); // ERROR
  }
}
```

Disable ANSI color (Android Studio console) / 关闭颜色（Android Studio 不支持 ANSI）:

```dart
DLog.enableColor = false;
```

![](https://raw.githubusercontent.com/shang1219178163/ddlog/refs/heads/develop/example/assets/images/andriodStudio_screenshot.webp)

Enable color (VS Code) / 打开颜色（VS Code 支持）:

```dart
DLog.enableColor = true;
```

![](https://github.com/shang1219178163/ddlog/blob/develop/example/assets/images/vscode_screenshot.png?raw=true)

## Getting Started / 开始使用

This package lives at `packages/ddlog` in the monorepo.  
本包位于 monorepo 的 `packages/ddlog`。

External apps / 外部项目:

```yaml
dependencies:
  flutter:
    sdk: flutter
  ddlog: ^1.0.1
```
