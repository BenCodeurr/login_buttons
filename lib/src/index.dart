import 'package:flutter/material.dart';
import 'package:login_button_suite/dependencies/loading_indicator.dart';
import 'package:login_button_suite/src/enums/login_button_style.dart';
import 'package:login_button_suite/src/enums/login_provider.dart';
import 'package:login_button_suite/src/helpers/computers.dart';
import 'package:login_button_suite/src/helpers/locals.dart';

class LoginButtons {
  static Widget google({
    required VoidCallback onPressed,
    String text = Locals.continueWithGoogle,
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
    String? imagePath,
  }) {
    return LoginButton(
      imagePath:
          Computers.computeImagePath(style, imagePath, LoginProvider.google),
      text: text,
      onPressed: onPressed,
      style: style,
      isLoading: isLoading,
    );
  }

  static Widget apple({
    required VoidCallback onPressed,
    String text = Locals.continueWithApple,
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
    String? imagePath,
  }) {
    return LoginButton(
      imagePath:
          Computers.computeImagePath(style, imagePath, LoginProvider.apple),
      text: text,
      onPressed: onPressed,
      style: style,
      isLoading: isLoading,
    );
  }

  static Widget linkedin({
    required VoidCallback onPressed,
    String text = Locals.continueWithLinkedIn,
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
    String? imagePath,
  }) {
    return LoginButton(
      imagePath:
          Computers.computeImagePath(style, imagePath, LoginProvider.linkedin),
      text: text,
      onPressed: onPressed,
      style: style,
      isLoading: isLoading,
    );
  }
}

class LoginButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  final LoginButtonStyle style;
  final bool isLoading;

  Color get _backgroundColor {
    switch (style) {
      case LoginButtonStyle.white:
        return Colors.white;
      case LoginButtonStyle.black:
        return Colors.black;
    }
  }

  Color get _foregroundColor {
    switch (style) {
      case LoginButtonStyle.white:
        return Colors.black;
      case LoginButtonStyle.black:
        return Colors.white;
    }
  }

  const LoginButton({
    super.key,
    this.style = LoginButtonStyle.white,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(_backgroundColor),
        foregroundColor: WidgetStateProperty.all<Color>(_foregroundColor),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        overlayColor: WidgetStateProperty.all(Colors.grey.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              LoadingIndicator(color: _foregroundColor)
            else
              Image.asset(
                imagePath,
                height: 25.0,
                width: 25.0,
              ),
            const SizedBox(width: 20.0),
            Text(
              text,
              style: TextStyle(
                color: _foregroundColor,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
