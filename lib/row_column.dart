import 'package:belajar_flutter_1/Gambar_Widget.dart';
import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Genshin"),
          SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 202, 55, 255),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("asset/raiden.png"),
                        width: 300,
                      ),
                      Text("Raiden"),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("asset/zhongli.png"),
                        width: 300,
                      ),
                      Text("Zhongli"),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
