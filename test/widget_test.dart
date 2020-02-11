import 'package:flutter_test/flutter_test.dart';

import 'package:polis/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('1'), findsNothing);
  });
}
