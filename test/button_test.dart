import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_button_suite/login_button_suite.dart';
import 'package:login_button_suite/dependencies/loading_indicator.dart';

void main() {
  testWidgets('LoginButtons.google renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.google(onPressed: () {}),
      ),
    );

    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('LoginButton handles loading state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.google(
          onPressed: () {},
          isLoading: true,
        ),
      ),
    );

    expect(find.byType(LoadingIndicator), findsOneWidget);
    expect(find.byType(Image), findsNothing);
  });
}