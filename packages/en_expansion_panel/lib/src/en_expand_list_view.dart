//
//  ExpandSectionListView.dart
//  fluttertemplet
//
//  Created by shang on 11/3/21 3:01 PM.
//  Copyright © 11/3/21 shang. All rights reserved.
//

import 'package:flutter/material.dart';
import 'en_expansion_panel.dart';

// ignore: must_be_immutable
/// custom: Expand List view
class EnExpandListView<E> extends StatefulWidget {
  const EnExpandListView({
    super.key,
    required this.children,
    this.controller,
  });

  final ScrollController? controller;
  final List<ExpandPanelModel<E>> children;

  @override
  State<EnExpandListView<E>> createState() =>
      _EnExpandListViewState<E>();
}

class _EnExpandListViewState<E> extends State<EnExpandListView<E>> {
  late final _scrollController = widget.controller ?? ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: EnExpansionPanelList(
          // dividerColor: Colors.red,
          // elevation: 4,
          materialGapSize: 0,
          expandedHeaderPadding: const EdgeInsets.only(top: 0, bottom: 0),
          expansionCallback: (int index, bool isExpanded) {
            widget.children[index].isExpanded = !isExpanded;
            setState(() {});
          },
          children: widget.children.map((e) {
            return EnExpansionPanel(
              isExpanded: e.isExpanded,
              canTapOnHeader: true,
              backgroundColor: e.backgroundColor,
              arrowColor: e.arrowColor,
              arrowPadding: e.arrowPadding,
              arrowPosition: e.arrowPosition,
              arrowExpanded: e.arrowExpanded,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return e.headerBuilder(context, isExpanded);
              },
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: e.bodyChildren
                    .map((item) => Column(
                          children: [
                            // if (e.bodyChildren.first == item) Divider(),
                            e.bodyItemBuilder(context, item),
                            if (e.bodyChildren.last != item)
                              const Divider(
                                height: 1,
                              ),
                          ],
                        ))
                    .toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandPanelModel<E> extends EnExpansionPanel {
  ExpandPanelModel({
    required this.bodyChildren,
    required this.bodyItemBuilder,
    required super.headerBuilder,
    super.isExpanded,
    super.canTapOnHeader = true,
    super.backgroundColor,
    super.arrowColor,
    super.arrowPadding,
    super.arrowPosition,
    super.arrowExpanded,
    super.arrow,
  }) : super(
            body: Container());

  final List<E> bodyChildren;

  final Widget Function(BuildContext context, E e) bodyItemBuilder;
}
