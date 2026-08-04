//
//  ddlog.dart
//  ddlog
//
//  Created by shang on 7/4/21 3:53 PM.
//  Copyright © 7/4/21 shang. All rights reserved.
//

import 'dart:developer' as developer;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class DLog {
  /// 是否启用日志打印
  static bool enableLog = true;

  /// 开启颜色
  static bool enableColor = true;

  // ANSI 颜色代码
  static const String _ansiReset = '\x1B[0m';
  static const String _ansiRed = '\x1B[31m';
  static const String _ansiGreen = '\x1B[32m';
  static const String _ansiYellow = '\x1B[33m';
  static const String _ansiBlue = '\x1B[34m';
  // static const String _ansiGray = '\x1B[37m';

  // Web 控制台颜色样式
  static const String _webRed = 'color: red';
  static const String _webGreen = 'color: #4CAF50';
  static const String _webYellow = 'color: #FFC107';
  static const String _webBlue = 'color: #2196F3';
  // static const String _webGray = 'color: #9E9E9E';

  // 打印调试日志
  static String d(dynamic message) {
    return _printLog('DEBUG', message, _ansiBlue, _webBlue);
  }

  // 打印信息日志
  static String i(dynamic message) {
    return _printLog('INFO', message, _ansiGreen, _webGreen);
  }

  // 打印警告日志
  static String w(dynamic message) {
    return _printLog('WARN', message, _ansiYellow, _webYellow);
  }

  // 打印错误日志
  static String e(dynamic message) {
    return _printLog('ERROR', message, _ansiRed, _webRed);
  }

  static void center(List<String> list) {
    if (list.isEmpty) {
      return;
    }

    String line(String text, {String fill = " ", required int maxLength}) {
      final fillCount = maxLength - text.length;
      final left = fillCount ~/ 2;
      final right = fillCount - left;
      return '${fill * left}$text${fill * right}';
    }

    var maxLength = 0;
    for (final e in list) {
      if (e.length > maxLength) {
        maxLength = e.length;
      }
    }

    for (final e in list) {
      d(line(e, maxLength: maxLength));
    }
  }

  // 获取调用信息
  static (String className, String functionName, String fileName, int lineNumber) _getCallerInfo() {
    try {
      final frames = StackTrace.current.toString().split('\n');
      // #0 _getCallerInfo, #1 _printLog, #2 d/i/w/e, #3 调用方
      if (frames.length > 3) {
        final frame = frames[3];

        // 类.方法：类名不允许含路径字符，避免顶层函数误吞 `.dart`
        final classMatch =
            RegExp(r'#\d+\s+([A-Za-z_][\w]*)\.([A-Za-z_][\w]*)').firstMatch(frame);
        var className = classMatch?.group(1) ?? '';
        var functionName = classMatch?.group(2) ?? '';

        if (className.isEmpty) {
          final topLevel = RegExp(r'#\d+\s+([A-Za-z_][\w]*)\s+\(').firstMatch(frame);
          functionName = topLevel?.group(1) ?? 'unknown';
        }

        // package:/file: 路径中的 .dart:line
        final fileMatch = RegExp(
          r'(?:package:|dart:|file:///?|[A-Za-z]:\\|/)([^\s:)]+\.dart):(\d+)(?::\d+)?',
        ).firstMatch(frame);
        var fileName = fileMatch?.group(1) ?? '';
        final lineNumber = int.tryParse(fileMatch?.group(2) ?? '0') ?? 0;
        if (fileName.isNotEmpty) {
          fileName = fileName.replaceAll('\\', '/').split('/').last;
        }

        return (
          className.isEmpty ? 'Unknown' : className,
          functionName.isEmpty ? 'unknown' : functionName,
          fileName,
          lineNumber,
        );
      }
    } catch (e) {
      debugPrint('Error getting caller info: $e');
    }
    return ('', '', '', 0);
  }

  // 获取当前平台
  static String _getPlatform() {
    if (kIsWeb) {
      return 'Web';
    }
    try {
      return Platform.operatingSystem;
    } catch (e) {
      // 如果 Platform 不可用，返回 Unknown
      return '';
    }
  }

  // 内部打印方法
  static String _printLog(String level, dynamic message, String ansiColor, String webColor) {
    if (!enableLog || !kDebugMode) {
      return "";
    }

    final (className, functionName, fileName, lineNumber) = _getCallerInfo();
    final now = DateTime.now();
    final timeStr = now.toString();
    final platform = _getPlatform();

    final caller = StringBuffer();
    if (className.isNotEmpty && className != 'Unknown') {
      caller.write('$className.');
    }
    caller.write(functionName);
    if (fileName.isNotEmpty) {
      caller.write(' $fileName');
    }
    if (lineNumber > 0) {
      caller.write(':$lineNumber');
    }

    final logMessage = '[$timeStr][$level][$platform][$caller]: $message';

    if (kIsWeb) {
      return _printLogWeb(level, logMessage, webColor);
    } else {
      return _printLogNative(level, logMessage, ansiColor);
    }
  }

  // Web 平台的打印实现
  static String _printLogWeb(String level, String message, String webColor) {
    developer.log(message);
    return message;
  }

  // 原生平台的打印实现
  static String _printLogNative(String level, String message, String ansiColor) {
    final sb = StringBuffer();
    if (enableColor) {
      sb.write(ansiColor);
    }
    sb.write(message);
    if (enableColor) {
      sb.write(_ansiReset);
    }

    final result = sb.toString();
    developer.log(sb.toString());
    return result;
  }
}
