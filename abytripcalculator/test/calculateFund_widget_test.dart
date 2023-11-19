import 'package:abytripcalculator/pages/calculateFundPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp( // Wrap with MaterialApp
        home: CalculateFundPage(),
      ),
    );
    // Find TextFormField by searching for an ancestor Scaffold
    var textField = find.descendant(
      of: find.ancestor(
        of: find.byType(Scaffold),
        matching: find.byType(SingleChildScrollView),
      ),
      matching: find.byType(Form),
    ).evaluate().single.widget;

    // Assuming your TextFormField is directly inside the Form
    var textFormFieldFinder = find.descendant(
      of: find.byWidget(textField),
      matching: find.byType(TextFormField),
    );

    expect(textFormFieldFinder, findsOneWidget);
  });
}