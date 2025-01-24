import 'package:flutter/material.dart';
import 'package:login_buttons/widgets/loading_indicator.dart';

class LoginButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;
  final LoginButtonStyle style;
  final bool isLoading;

  const LoginButton({
    super.key,
    this.style = LoginButtonStyle.white,
    required this.imagePath,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade200;
            }
            return Colors.white;
          },
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
              const LoadingIndicator(color: Colors.black)
            else
              Image.asset(
                imagePath,
                height: 25.0,
                width: 25.0,
              ),
            const SizedBox(width: 20.0),
            Text(
              'Continuez avec $title',
              style: const TextStyle(
                color: Colors.black,
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

enum IconPosition {
  left,
  right,
}
