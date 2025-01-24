import 'package:flutter/material.dart';
import 'package:login_buttons/dependencies/loading_indicator.dart';

class LoginButtons {
  static Widget google({
    required VoidCallback onPressed,
    String text = 'Continue with Google',
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
  }) {
    return LoginButton(
      imagePath: 'assets/images/google.png',
      text: text,
      onPressed: onPressed,
      style: style,
      isLoading: isLoading,
    );
  }

  static Widget apple({
    required VoidCallback onPressed,
    String text = 'Continue with Apple',
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
  }) {
    String imagePath = style == LoginButtonStyle.black
        ? 'assets/images/apple_white.png'
        : 'assets/images/apple_black.png';
    return LoginButton(
      imagePath: imagePath,
      text: text,
      onPressed: onPressed,
      style: style,
      isLoading: isLoading,
    );
  }

  static Widget linkedin({
    required VoidCallback onPressed,
    String text = 'Continue with LinkedIn',
    LoginButtonStyle style = LoginButtonStyle.white,
    bool isLoading = false,
  }) {
    return LoginButton(
      imagePath: 'assets/images/linkedin.png',
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
        backgroundColor: MaterialStateProperty.all<Color>(_backgroundColor),
        foregroundColor: MaterialStateProperty.all<Color>(_foregroundColor),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.grey.shade100),
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

enum LoginButtonStyle {
  white,
  black,
}

// enum IconPosition {
//   left,
//   right,
// }
