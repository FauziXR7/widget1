import 'package:flutter/material.dart';
import 'package:belajar_flutter_1/scaffold_widget.dart';
import 'Gambar_Widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldWidget(),
      //Dialog()
    );
  }
}
