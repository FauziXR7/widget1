import 'package:belajar_flutter_1/datewidget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Gambar_Widget.dart';
import 'dialog.dart';
import 'datewidget.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tes 1'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.dashboard),
        ),
        backgroundColor: Color.fromARGB(255, 202, 55, 255),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: const Center(
        child: Column(
          children: [
            GambarWidget(),
            DialogWidget(),
            Datewidget()
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 8, 0, 255),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
        ],
      ),
    );
  }
}
