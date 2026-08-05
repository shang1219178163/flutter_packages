import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _demos = <(String, String, String)>[
    (
      'EnExpansionPanel',
      'Enhanced ExpansionPanelList / ExpansionTile',
      AppRoutes.expansionPanelPath,
    ),
    (
      'EnStepper',
      'Enhanced Stepper with title/line positions',
      AppRoutes.stepperPath,
    ),
    (
      'EnBottomNavigationBar',
      'Bottom bar with onDoubleTap / tileBuilder',
      AppRoutes.bottomNavigationBarPath,
    ),
    (
      'EnBoxDecoration',
      'BoxDecoration with innerBoxShadow',
      AppRoutes.boxDecorationPath,
    ),
    (
      'EnDecorationImage',
      'DecorationImage with placeholder / offset',
      AppRoutes.decorationImagePath,
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
          final (title, subtitle, location) = _demos[index];
          return ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(location),
          );
        },
      ),
    );
  }
}
