import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double size;

  const LoadingIndicator({
    super.key,
    this.color,
    this.size = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: color ?? Colors.white,
      size: size,
    );
  }
}
