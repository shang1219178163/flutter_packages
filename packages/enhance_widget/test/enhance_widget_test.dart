import 'package:enhance_widget/enhance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EnStepper builds steps', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EnStepper(
            steps: const [
              EnStep(title: Text('A'), content: Text('content-a')),
              EnStep(title: Text('B'), content: Text('content-b')),
            ],
          ),
        ),
      ),
    );

    expect(find.text('A'), findsOneWidget);
    expect(find.text('content-a'), findsOneWidget);
  });

  testWidgets('EnExpansionPanelList expands', (tester) async {
    var expanded = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: EnExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() => expanded = !isExpanded);
                  },
                  children: [
                    EnExpansionPanel(
                      isExpanded: expanded,
                      canTapOnHeader: true,
                      headerBuilder: (context, isExpanded) {
                        return const ListTile(title: Text('Header'));
                      },
                      body: const Text('Body'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('Header'), findsOneWidget);
    await tester.tap(find.text('Header'));
    await tester.pumpAndSettle();
    expect(find.text('Body'), findsOneWidget);
  });

  test('EnBoxDecoration retains innerBoxShadow', () {
    const decoration = EnBoxDecoration(
      color: Color(0xFFFFFFFF),
      innerBoxShadow: [
        BoxShadow(color: Color(0xFF0000FF), blurRadius: 8),
      ],
    );
    expect(decoration.innerBoxShadow, isNotNull);
    expect(decoration.innerBoxShadow!.length, 1);
  });
}
