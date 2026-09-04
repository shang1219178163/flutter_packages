import 'package:animated_halo/animated_halo.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double size = 150;
  double spacing = 6;
  double strokeWidth = 2;
  double innerStrokeWidth = 4;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () {
              size = 150;
              spacing = 6;
              strokeWidth = 2;
              innerStrokeWidth = 4;
              setState(() {});
            },
            child: Text('重置', style: TextStyle(color: scheme.onPrimary)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: AnimatedHalo(
                size: size,
                spacing: spacing,
                strokeWidth: strokeWidth,
                innerStrokeWidth: innerStrokeWidth,
                child: ClipOval(
                  child: Container(
                    width: size * 0.55,
                    height: size * 0.55,
                    color: scheme.primaryContainer,
                    alignment: Alignment.center,
                    child: Icon(Icons.face,
                        size: size * 0.35, color: scheme.onPrimaryContainer),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  _slider('size',
                      max: 200,
                      value: size,
                      onChanged: (v) => setState(() => size = v)),
                  _slider('spacing',
                      max: 24,
                      value: spacing,
                      onChanged: (v) => setState(() => spacing = v),
                      fraction: 1),
                  _slider('strokeWidth',
                      max: 8,
                      value: strokeWidth,
                      onChanged: (v) => setState(() => strokeWidth = v),
                      fraction: 1),
                  _slider('innerStrokeWidth',
                      max: 8,
                      value: innerStrokeWidth,
                      onChanged: (v) => setState(() => innerStrokeWidth = v),
                      fraction: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _slider(
    String label, {
    double min = 0,
    required double max,
    required double value,
    required ValueChanged<double> onChanged,
    int fraction = 0,
  }) {
    return ListTile(
      title: Text(label),
      subtitle: Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChanged,
      ),
      trailing: Text(value.toStringAsFixed(fraction)),
    );
  }
}
