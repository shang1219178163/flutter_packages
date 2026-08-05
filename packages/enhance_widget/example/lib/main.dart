import 'package:flutter/material.dart';

import 'demos/en_bottom_navigation_bar_demo.dart';
import 'demos/en_box_decoration_demo.dart';
import 'demos/en_decoration_image_demo.dart';
import 'demos/en_expansion_panel_demo.dart';
import 'demos/en_stepper_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'enhance_widget example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final _demos = <(String, String, WidgetBuilder)>[
    (
      'EnExpansionPanel',
      'Enhanced ExpansionPanelList / ExpansionTile',
      (_) => const EnExpansionPanelDemo(),
    ),
    (
      'EnStepper',
      'Enhanced Stepper with title/line positions',
      (_) => const EnStepperDemo(),
    ),
    (
      'EnBottomNavigationBar',
      'Bottom bar with onDoubleTap / tileBuilder',
      (_) => const EnBottomNavigationBarDemo(),
    ),
    (
      'EnBoxDecoration',
      'BoxDecoration with innerBoxShadow',
      (_) => const EnBoxDecorationDemo(),
    ),
    (
      'EnDecorationImage',
      'DecorationImage with placeholder / offset',
      (_) => const EnDecorationImageDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('enhance_widget')),
      body: ListView.separated(
        itemCount: _demos.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final (title, subtitle, builder) = _demos[index];
          return ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: builder),
              );
            },
          );
        },
      ),
    );
  }
}
