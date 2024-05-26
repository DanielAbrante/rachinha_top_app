import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    const String sourceImage = "assets/images/icon-192x192.png";
    const double width = 60.0;

    return const Image(image: AssetImage(sourceImage), width: width);
  }
}
