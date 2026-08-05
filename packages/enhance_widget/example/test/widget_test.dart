import 'package:enhance_widget_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home lists demos', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('enhance_widget'), findsOneWidget);
    expect(find.text('EnExpansionPanel'), findsOneWidget);
    expect(find.text('EnStepper'), findsOneWidget);
    expect(find.text('EnBottomNavigationBar'), findsOneWidget);
  });
}
