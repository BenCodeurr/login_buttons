import 'package:login_button_suite/src/enums/login_button_style.dart';
import 'package:login_button_suite/src/enums/login_provider.dart';

class Computers {
  static String computeImagePath(
      LoginButtonStyle style, String? imagePath, LoginProvider loginProvider) {
    if (imagePath != null) {
      return imagePath;
    }
    switch (loginProvider) {
      case LoginProvider.google:
        return _getGoogleImagePath(imagePath);
      case LoginProvider.apple:
        return _getAppleImagePath(style);
      case LoginProvider.linkedin:
        return _getLinkedInImagePath(imagePath);
    }
  }

  static String _getGoogleImagePath(String? imagePath) {
    return imagePath ?? 'assets/images/google.png';
  }

  static String _getAppleImagePath(LoginButtonStyle style) {
    switch (style) {
      case LoginButtonStyle.black:
        return 'assets/images/apple_white.png';
      case LoginButtonStyle.white:
        return 'assets/images/apple_black.png';
    }
  }

  static String _getLinkedInImagePath(String? imagePath) {
    return imagePath ?? 'assets/images/linkedin.png';
  }
}
