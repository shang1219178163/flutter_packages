import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';

class EnExpansionPanelDemo extends StatefulWidget {
  const EnExpansionPanelDemo({super.key});

  @override
  State<EnExpansionPanelDemo> createState() => _EnExpansionPanelDemoState();
}

class _EnExpansionPanelDemoState extends State<EnExpansionPanelDemo> {
  late final List<_PanelItem> _data = List.generate(8, (index) {
    return _PanelItem(
      index: index,
      headerValue: 'Panel $index',
      items: List.generate(index + 1, (i) => 'Item $i'),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EnExpansionPanel')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'EnExpansionPanelList',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          EnExpansionPanelList(
            materialGapSize: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (index, isExpanded) {
              setState(() => _data[index].isExpanded = !isExpanded);
            },
            children: _data.map((item) {
              return EnExpansionPanel(
                isExpanded: item.isExpanded,
                canTapOnHeader: true,
                arrowColor: Colors.blue,
                arrowPosition: EnExpansionPanelArrowPosition.tailing,
                arrow: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
                arrowExpanded:
                    const Icon(Icons.keyboard_arrow_down, color: Colors.red),
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                    subtitle: Text(isExpanded ? 'expanded' : 'collapsed'),
                  );
                },
                body: Column(
                  children: item.items
                      .map(
                        (e) => ListTile(
                          dense: true,
                          title: Text(e),
                          trailing: const Icon(Icons.chevron_right),
                        ),
                      )
                      .toList(),
                ),
              );
            }).toList(),
          ),
          const Divider(height: 32),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'EnExpansionTile',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          EnExpansionTile(
            title: const Text('Custom header tile'),
            subtitle: const Text('Tap to expand'),
            children: const [
              ListTile(title: Text('Child 1')),
              ListTile(title: Text('Child 2')),
              ListTile(title: Text('Child 3')),
            ],
          ),
        ],
      ),
    );
  }
}

class _PanelItem {
  _PanelItem({
    required this.index,
    required this.headerValue,
    required this.items,
  });

  final int index;
  final String headerValue;
  final List<String> items;
  bool isExpanded;
}
