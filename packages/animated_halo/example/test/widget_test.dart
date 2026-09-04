import 'package:flutter_test/flutter_test.dart';

import 'package:animated_halo_example/main.dart';

void main() {
  testWidgets('AnimatedHalo demo smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Title is shown in the AppBar.
    expect(find.text('AnimatedHalo'), findsOneWidget);
  });
}
