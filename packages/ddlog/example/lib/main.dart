import 'dart:convert';

import 'package:ddlog/ddlog.dart';
import 'package:ddlog_example/widgets/n_animated_segment_control.dart';
import 'package:ddlog_example/widgets/n_fade_label.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DLog.enableColor = false;

  runApp(MyApp());
}

enum LogLevel {
  debug(Colors.blue, Icons.bug_report_outlined, 'DEBUG'),
  info(Colors.green, Icons.info_outline, 'INFO'),
  warn(Colors.amber, Icons.warning_amber_rounded, 'WARN'),
  error(Colors.red, Icons.error_outline, 'ERROR');

  const LogLevel(this.color, this.icon, this.label);

  final Color color;
  final IconData icon;
  final String label;

  AnimatedSegmentItem<LogLevel> get segmentItem => AnimatedSegmentItem(
        value: this,
        color: color,
        icon: icon,
        label: label,
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ddlog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ddlog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _animDuration = Duration(milliseconds: 280);
  static const _animCurve = Curves.easeOutCubic;

  int _counter = 0;
  LogLevel _selectedLevel = LogLevel.debug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log Level',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
              ),
              const SizedBox(height: 12),
              NAnimatedSegmentControl<LogLevel>(
                items: LogLevel.values.map((e) => e.segmentItem).toList(),
                selected: _selectedLevel,
                duration: _animDuration,
                curve: _animCurve,
                onChanged: (level) {
                  if (level == _selectedLevel) return;
                  setState(() => _selectedLevel = level);
                },
              ),
              const SizedBox(height: 36),
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.blueGrey.shade600,
                    ),
              ),
              const SizedBox(height: 8),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(end: _selectedLevel.color),
                duration: _animDuration,
                curve: _animCurve,
                builder: (context, color, _) {
                  return Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w700,
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: NFadeLabel(
        duration: _animDuration,
        curve: _animCurve,
        onPressed: _incrementCounter,
        child: AnimatedContainer(
          key: ValueKey(_selectedLevel),
          duration: _animDuration,
          curve: _animCurve,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: _selectedLevel.color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _selectedLevel.icon,
                size: 22,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                'Log ${_selectedLevel.label}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() => _counter++);
    onTest();
  }

  void onTest() {
    try {
      var map = {};
      jsonDecode(map["a"]);
    } catch (e) {
      debugPrint("$this $e");
      final message = '$e';
      switch (_selectedLevel) {
        case LogLevel.debug:
          DLog.d(message);
        case LogLevel.info:
          DLog.i(message);
        case LogLevel.warn:
          DLog.w(message);
        case LogLevel.error:
          DLog.e(message);
      }
    }
  }
}
