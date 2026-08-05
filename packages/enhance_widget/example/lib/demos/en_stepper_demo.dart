import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/n_description_card.dart';

class EnStepperDemo extends StatefulWidget {
  const EnStepperDemo({super.key});

  @override
  State<EnStepperDemo> createState() => _EnStepperDemoState();
}

class _EnStepperDemoState extends State<EnStepperDemo> {
  StepperType _type = StepperType.horizontal;
  int _index = 0;

  final _items = <(IconData, StepState)>[
    (Icons.directions_bike, StepState.indexed),
    (Icons.directions_bus, StepState.editing),
    (Icons.directions_railway, StepState.complete),
    (Icons.directions_boat, StepState.disabled),
  ];

  void _go(int delta) {
    final next = _index + delta;
    if (next < 0 || next >= _items.length) return;
    setState(() => _index = next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnStepper'),
        actions: [
          IconButton(
            tooltip: 'Toggle orientation',
            onPressed: () {
              setState(() {
                _type = _type == StepperType.vertical
                    ? StepperType.horizontal
                    : StepperType.vertical;
              });
            },
            icon: const Icon(Icons.change_circle_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const NDescriptionCard(
            comparedTo: 'Stepper',
            items: [
              NDescriptionItem(
                en: 'horizontalTitlePosition: place titles below step circles (bottom)',
                zh: 'horizontalTitlePosition：标题可放在步骤圆点下方（bottom）',
              ),
              NDescriptionItem(
                en: 'horizontalLinePosition: place connector lines on top (top)',
                zh: 'horizontalLinePosition：连接线可置于顶部（top）',
              ),
              NDescriptionItem(
                en: 'Custom step icons via icon / stepIconBuilder',
                zh: '支持自定义 step 图标（icon / stepIconBuilder）',
              ),
            ],
          ),
          Expanded(
            child: EnStepper(
              type: _type,
              horizontalTitlePosition: HorizontalTitlePosition.bottom,
              horizontalLinePosition: HorizontalLinePosition.top,
              currentStep: _index,
              physics: const ClampingScrollPhysics(),
              steps: [
                for (var i = 0; i < _items.length; i++)
                  EnStep(
                    state: _items[i].$2,
                    isActive: _index == i,
                    title: Text('step $i'),
                    subtitle: Text(_items[i].$2.name),
                    content: Text('Content for Step $i'),
                  ),
              ],
              onStepCancel: () => _go(-1),
              onStepContinue: () => _go(1),
              onStepTapped: (index) => setState(() => _index = index),
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Next'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
