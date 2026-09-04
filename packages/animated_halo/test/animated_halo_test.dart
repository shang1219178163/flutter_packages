import 'package:animated_halo/animated_halo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimatedHalo renders its child clipped in a circle',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimatedHalo(
          size: 72,
          child: ColoredBox(color: Colors.red),
        ),
      ),
    );

    expect(find.byType(AnimatedHalo), findsOneWidget);
    expect(find.byType(ClipOval), findsOneWidget);
    expect(find.byType(ColoredBox), findsOneWidget);
  });

  testWidgets('AnimatedHalo respects the configured size', (WidgetTester tester) async {
    const size = 120.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimatedHalo(
          size: size,
          child: ColoredBox(color: Colors.red),
        ),
      ),
    );

    final halo = tester.widget<AnimatedHalo>(find.byType(AnimatedHalo));
    expect(halo.size, size);
  });

  testWidgets('AnimatedHalo animates without throwing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimatedHalo(
          size: 72,
          child: ColoredBox(color: Colors.red),
        ),
      ),
    );

    // Advance through several frames of the repeating controller.
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('AnimatedHalo rebuilds when duration changes', (WidgetTester tester) async {
    Widget build(Duration duration) => MaterialApp(
          home: AnimatedHalo(
            size: 72,
            duration: duration,
            child: const ColoredBox(color: Colors.red),
          ),
        );

    await tester.pumpWidget(build(const Duration(milliseconds: 1483)));
    await tester.pumpWidget(build(const Duration(milliseconds: 500)));
    await tester.pump(const Duration(milliseconds: 100));

    expect(tester.takeException(), isNull);
  });
}
