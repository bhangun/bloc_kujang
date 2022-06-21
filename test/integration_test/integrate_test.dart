import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class IntegrateTest {
  final WidgetTester tester;
  IntegrateTest(this.tester);
  
  Future<void> clickNavigationDrawerButton() async {
    final drawerButtonFinder = find.byKey(Key('drawerButton'));

    await tester.ensureVisible(drawerButtonFinder);
    await tester.tap(drawerButtonFinder);

    await tester.pumpAndSettle();
  }

}