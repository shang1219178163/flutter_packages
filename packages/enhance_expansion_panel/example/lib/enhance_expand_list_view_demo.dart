//
//  EnhanceExpandListViewDemo.dart
//  enhance_expansion_panel
//
//  Created by shang on 11/4/21 11:11 AM.
//  Copyright © 11/4/21 shang. All rights reserved.
//

import 'package:enhance_expansion_panel/enhance_expansion_panel.dart';
import 'package:flutter/material.dart';

class EnhanceExpandListViewDemo extends StatefulWidget {
  final String? title;

  const EnhanceExpandListViewDemo({super.key, this.title});

  @override
  State<EnhanceExpandListViewDemo> createState() =>
      _EnhanceExpandListViewDemoState();
}

class _EnhanceExpandListViewDemoState extends State<EnhanceExpandListViewDemo> {
  final _sections = [
    ("section0", List.generate(0, (index) => ("0", "$index"))),
    ("section1", List.generate(1, (index) => ("1", "$index"))),
    ("section2", List.generate(2, (index) => ("2", "$index"))),
    ("section3", List.generate(3, (index) => ("3", "$index"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "$widget"),
        ),
        body: EnhanceExpandListView(
          children: _sections
              .map<ExpandPanelModel<(String, String)>>(
                  (e) => ExpandPanelModel(
                        canTapOnHeader: true,
                        isExpanded: false,
                        arrowPosition: EnhanceExpansionPanelArrowPosition.none,
                        // backgroundColor: Color(0xFFDDDDDD),
                        headerBuilder: (contenx, isExpand) {
                          return Container(
                            // color: Colors.green,
                            color: isExpand ? Colors.black12 : null,
                            child: ListTile(
                              title: Text(
                                e.$1,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text("${e.$2.length}"),
                            ),
                          );
                        },
                        bodyChildren: e.$2,
                        bodyItemBuilder: (context, e) {
                          return ListTile(
                            title: Text(
                              e.$2,
                              style: const TextStyle(fontSize: 14),
                            ),
                            // subtitle: Text(e.$2, style: TextStyle(fontSize: 12),),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              debugPrint(
                                  [DateTime.now(), e.$1, e.$2].toString());
                            },
                          );
                        },
                      ))
              .toList(),
        ));
  }
}
