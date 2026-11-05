import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_button_suite/login_button_suite.dart';
import 'package:login_button_suite/dependencies/loading_indicator.dart';

void main() {
  testWidgets('LoginButtons.google renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.google(onPressed: () {}),
      ),
    );

    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets(
      'LoginButtons.google renders correctly with custom image path and custom label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.google(
          text: 'Sign in with Google',
          imagePath: 'assets/images/mushroom.png',
          onPressed: () {},
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));

    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'assetName',
        'assets/images/mushroom.png',
      ),
    );
  });

  testWidgets(
      'LoginButtons.apple renders correctly with custom image path and custom label',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.apple(
          text: 'Sign in with Apple',
          imagePath: 'assets/images/mushroom.png',
          onPressed: () {},
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));

    expect(find.text('Sign in with Apple'), findsOneWidget);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'assetName',
        'assets/images/mushroom.png',
      ),
    );
  });

  testWidgets(
      'LoginButtons.apple renders correctly without custom image path in dark mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.apple(
          style: LoginButtonStyle.black,
          onPressed: () {},
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));

    expect(find.text('Continue with Apple'), findsOneWidget);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'assetName',
        'assets/images/apple_white.png',
      ),
    );
  });

  testWidgets(
      'LoginButtons.apple renders correctly without custom image path in light mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.apple(
          style: LoginButtonStyle.white,
          onPressed: () {},
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));

    expect(find.text('Continue with Apple'), findsOneWidget);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'assetName',
        'assets/images/apple_black.png',
      ),
    );
  });

  testWidgets(
      'LoginButtons.linkedin renders correctly without custom image path',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginButtons.linkedin(
          style: LoginButtonStyle.white,
          onPressed: () {},
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));

    expect(find.text('Continue with LinkedIn'), findsOneWidget);
    expect(
      image.image,
      isA<AssetImage>().having(
        (asset) => asset.assetName,
        'assetName',
        'assets/images/linkedin.png',
      ),
    );
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
