//
//  EnhanceExpansionPanelDemo.dart
//  enhance_expansion_panel
//
//  Created by shang on 10/28/21 8:59 AM.
//  Copyright © 10/28/21 shang. All rights reserved.
//

import 'package:ddlog/ddlog.dart';
import 'package:enhance_expansion_panel/enhance_expansion_panel.dart';
import 'package:flutter/material.dart';

class EnhanceExpansionPanelDemo extends StatefulWidget {
  final String? title;
  final bool? appBarHide;

  const EnhanceExpansionPanelDemo({super.key, this.title, this.appBarHide});

  @override
  State<EnhanceExpansionPanelDemo> createState() => _EnhanceExpansionPanelDemoState();
}

class _EnhanceExpansionPanelDemoState extends State<EnhanceExpansionPanelDemo> {
  late bool _isExpand = false;

  late List<ExpandedItem<String>> _data;

  @override
  void initState() {
    _data = _generateItems(20);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBarHide == true
          ? null
          : AppBar(
              title: Text("$widget"),
              actions: [
                IconButton(
                  icon: _isExpand ? const Icon(Icons.expand_less) : const Icon(Icons.expand_more),
                  color: _isExpand ? Colors.red : Colors.white,
                  onPressed: () {
                    setState(() {
                      _isExpand = !_isExpand;
                    });
                  },
                ),
              ],
            ),
      body: SafeArea(
        child: Column(
          children: [
            // buildExpandIcon(),
            // CustomExpansionTile(),
            Expanded(child: buildExpansionPanelList()),
          ],
        ),
      ),
    );
  }

  Widget buildExpandIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.green,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 25),
              const Expanded(
                child: Text(
                  'ExpandIcon Row',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              ExpandIcon(
                isExpanded: _isExpand,
                color: Colors.white,
                expandedColor: Colors.black,
                disabledColor: Colors.grey,
                onPressed: (bool isExpanded) {
                  setState(() {
                    _isExpand = !isExpanded;
                    DLog.d(isExpanded);
                  });
                },
              ),
              const SizedBox(width: 25),
            ],
          ),
        ),
        Visibility(
          visible: _isExpand,
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              '我被 ExpandIcon 控制显示状态',
              style: TextStyle(
                color: Colors.black,
                // decorationColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///build EnhanceExpansionPanelList
  Widget buildExpansionPanelList() {
    return SingleChildScrollView(
      child: EnhanceExpansionPanelList(
        dividerColor: Colors.red,
        // elevation: 4,
        materialGapSize: 0,
        expandedHeaderPadding: const EdgeInsets.only(top: 0, bottom: 0),
        expansionCallback: (int index, bool isExpanded) {
          _data[index].isExpanded = !isExpanded;
          setState(() {});
        },
        children: _data.map<EnhanceExpansionPanel>((item) {
          return EnhanceExpansionPanel(
            isExpanded: item.isExpanded,
            canTapOnHeader: true,

            /// custom property
            /// color
            arrowColor: Colors.blue,

            /// leading, tailing, none
            arrowPosition: EnhanceExpansionPanelArrowPosition.tailing,

            /// padding
            arrowPadding: const EdgeInsets.all(5),

            /// custome wiget
            arrow: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.blue,
            ),

            /// custome wiget by isExpanded
            arrowExpanded: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.red,
            ),

            /// custome wiget
            // arrow: const Icon(Icons.directions_bike, color: Colors.blue,),
            // /// custome wiget by isExpanded
            // arrowExpanded: const Icon(Icons.directions_boat, color: Colors.red,),
            /// custom property
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
                subtitle: const Text("subtitle"),
                // trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.red,),
                // trailing: Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, color: Colors.red,),
              );
            },
            body: _buildExpansionPanelBody(item.index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExpansionPanelBody(int section) {
    final item = _data[section];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: item.items
          .map((e) => Column(
                children: [
                  // if (item.items.first == e) Divider(color: Colors.blue,),
                  ListTile(
                      dense: true,
                      title: Text("detail index: $e"),
                      subtitle: const Text('To delete this panel, tap the trash can icon'),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        DLog.d("section_${section}_$e");
                        setState(() {});
                      }),
                  if (item.items.last != e)
                    const Divider(
                      color: Colors.blue,
                    ),
                ],
              ))
          .toList(),
    );
  }

  _buildListTitle(ExpandedItem item) {
    return ListTile(
      title: Text(item.expandedValue),
      subtitle: const Text('To delete this panel, tap the trash can icon'),
      trailing: const Icon(Icons.delete),
      onTap: () {
        setState(() {
          _data.removeWhere((ExpandedItem currentItem) => item == currentItem);
        });
      },
    );
  }

  List<ExpandedItem<String>> _generateItems(int count) {
    return List<ExpandedItem<String>>.generate(count, (int index) {
      return ExpandedItem<String>(
        index: index,
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
        items: List.generate(index, (index) => "$index"),
      );
    });
  }
}

// stores ExpansionPanel state information
class ExpandedItem<E> {
  int index;
  String expandedValue;
  String headerValue;
  bool isExpanded;

  List<E> items;

  ExpandedItem({
    required this.index,
    required this.expandedValue,
    required this.headerValue,
    required this.items,
    this.isExpanded = false,
  });
}

///自定义视图
class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({super.key});

  @override
  State createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(
        Icons.face,
        size: 36.0,
      ),
      trailing: const SizedBox(),
      title: Container(
        color: isExpanded ? Colors.orange : Colors.green,
        child: Text(
          "title",
          style: TextStyle(
            color: isExpanded ? Colors.black : Colors.black,
          ),
        ),
      ),
      subtitle: const Text("subtitle"),
      children: const <Widget>[
        Text("Child Widget One"),
        Divider(),
        Text("Child Widget Two"),
        Divider(),
        Text("Child Widget Three"),
      ],
      onExpansionChanged: (bool expanding) => setState(() => isExpanded = expanding),
    );
  }
}
