import 'package:flutter/material.dart';

class GambarWidget extends StatelessWidget {
  const GambarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('asset/raiden.png'));
  }
}