import 'package:ddlog/ddlog.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    DLog.enableLog = true;
    DLog.enableColor = false;
  });

  test('log output includes file name', () {
    final out = DLog.d('hello');
    expect(out, contains('hello'));
    expect(out, contains('.dart:'));
  });

  test('center empty list does not throw', () {
    expect(() => DLog.center([]), returnsNormally);
  });
}
