import 'package:flutter_test/flutter_test.dart';

import 'package:mood_diary_app_with_flutter/src/views/pages/exports_pages.dart';

void main() {
  testWidgets('Initialization App', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
  });
}
