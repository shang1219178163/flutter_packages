import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/n_description_card.dart';

class EnBottomNavigationBarDemo extends StatefulWidget {
  const EnBottomNavigationBarDemo({super.key});

  @override
  State<EnBottomNavigationBarDemo> createState() =>
      _EnBottomNavigationBarDemoState();
}

class _EnBottomNavigationBarDemoState extends State<EnBottomNavigationBarDemo> {
  int _index = 0;
  String _lastAction = 'tap / double-tap an item';

  static const _tabs = <(String, IconData)>[
    ('Home', Icons.home),
    ('Pets', Icons.pets),
    ('Chat', Icons.message),
    ('Cart', Icons.shopping_cart),
    ('Me', Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('EnBottomNavigationBar')),
      body: Column(
        children: [
          const NDescriptionCard(
            comparedTo: 'BottomNavigationBar',
            items: [
              NDescriptionItem(
                en: 'onDoubleTap: double-tap callback for each item',
                zh: '新增 onDoubleTap：支持双击回调',
              ),
              NDescriptionItem(
                en: 'tileBuilder: customize each tile by selected state',
                zh: '新增 tileBuilder：可按选中态自定义每个 item 的布局',
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Selected: ${_tabs[_index].$1}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(_lastAction),
                  const SizedBox(height: 8),
                  const Text(
                    'Home uses tileBuilder when selected.\nDouble-tap any item to see onDoubleTap.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: EnBottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: primary,
        onTap: (index) {
          setState(() {
            _index = index;
            _lastAction = 'onTap → index $index';
          });
        },
        onDoubleTap: (index) {
          setState(() => _lastAction = 'onDoubleTap → index $index');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Double tapped ${_tabs[index].$1}')),
          );
        },
        items: [
          for (final (label, icon) in _tabs)
            BottomNavigationBarItem(
              tooltip: '',
              label: label,
              icon: Icon(icon),
            ),
        ],
        tileBuilder: (index, selected, icon, label) {
          if (index == 0 && selected) {
            return Container(
              constraints: const BoxConstraints(maxHeight: 40),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: CircleBorder(side: BorderSide(color: primary)),
              ),
              child: Icon(Icons.color_lens, color: primary, size: 36),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [icon, label],
          );
        },
      ),
    );
  }
}
