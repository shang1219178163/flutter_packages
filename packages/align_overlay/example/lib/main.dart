//
//  Main.dart
//  align_overlay
//
//  Created by shang on 2025/12/27.
//  Copyright © 2025/12/27 shang. All rights reserved.
//

import 'package:align_overlay/align_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
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
  List<Alignment> alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  var alignment = Alignment.center;

  late final themeData = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "PopupRoute direction from Alignment.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            buildWrap(
              onChanged: (v) {
                alignment = v;
                debugPrint("$alignment ${alignment.x} ${alignment.y}");
                onPopupRoute();
              },
            ),
            Divider(),
            const Text(
              "OverlayEntry direction from Alignment.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            buildWrap(
              onChanged: (v) {
                alignment = v;
                debugPrint("$alignment ${alignment.x} ${alignment.y}");
                AlignOverlayDialog.show(
                  context,
                  from: v,
                  barrierColor: Colors.black12,
                  // barrierDismissible: false,
                  onBarrier: () {
                    debugPrint('AlignOverlayDialog onBarrier');
                  },
                  child: Container(
                    width: 300,
                    height: 300,
                    child: buildContent(
                      title: v.toString(),
                      onTap: () {
                        AlignOverlayDialog.dismiss();
                        debugPrint('AlignOverlayDialog onBarrier');
                      },
                    ),
                  ),
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        AlignOverlayDialog.sheet(
                          context,
                          child: buildContent(
                            height: 400,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            title: "AlignOverlayDialog.sheet",
                            onTap: () {
                              AlignOverlayDialog.dismiss();
                            },
                          ),
                        );
                      },
                      child: Text("AlignOverlayDialog.sheet"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AlignOverlayDialog.drawer(
                          context,
                          child: buildContent(
                            title: "AlignOverlayDialog.drawer",
                            radius: 0,
                            onTap: () {
                              AlignOverlayDialog.dismiss();
                            },
                          ),
                        );
                      },
                      child: Text("AlignOverlayDialog.drawer"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AlignOverlayDialog.toast(
                          context,
                          hideBarrier: true,
                          from: Alignment.center,
                          message: "This is a Toast!",
                        );
                      },
                      child: Text("AlignOverlayDialog.toast"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        AlignOverlayDialog.loadding(
                          context,
                          indicator: CupertinoActivityIndicator(radius: 16, color: Colors.white),
                          child: Container(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ElevatedButton(
                              onPressed: AlignOverlayDialog.dismiss,
                              child: Text('dismiss'),
                            ),
                          ),
                        );
                      },
                      child: Text("AlignOverlayDialog.loading"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWrap({required ValueChanged<Alignment> onChanged}) {
    final list = alignments;
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 8.0;
        final rowCount = 3.0;
        final itemWidth = (constraints.maxWidth - spacing * (rowCount - 1)) / rowCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          // crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...list.map(
              (e) {
                final i = list.indexOf(e);
                final btnTitle = [e.toString().split(".").last, "(${e.x}, ${e.y})"].join("\n");
                return GestureDetector(
                  onTap: () => onChanged(e),
                  child: Container(
                    width: itemWidth.truncateToDouble(),
                    height: itemWidth * 0.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Text(btnTitle),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> onPopupRoute() async {
    final route = AlignPopupRoute(
      from: alignment,
      builder: (_) {
        return buildPopupView(alignment: alignment, argsDismiss: {"b": "88"});
      },
    );
    final result = await Navigator.of(context).push(route);
    print(["result", result.runtimeType, result]);
  }

  Widget buildPopupView({
    required Alignment alignment,
    Map<String, dynamic>? argsDismiss,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 300,
        height: 400,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          // border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(argsDismiss);
          },
          child: Text("dismiss"),
        ),
      ),
    );
  }

  Widget buildContent({
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    double? radius,
    String? title,
    VoidCallback? onTap,
  }) {
    final btnTitle = title ?? "buildContent";
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
      ),
      child: ElevatedButton(
        onPressed: () {
          debugPrint(btnTitle);
          onTap?.call();
        },
        child: Text(btnTitle),
      ),
    );
  }
}
