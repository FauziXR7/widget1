import 'package:belajar_flutter_1/tes.dart';
import 'package:belajar_flutter_1/tugas.dart';
import 'package:belajar_flutter_1/tugaspakarifin.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter_1/scaffold_widget.dart';
import 'Gambar_Widget.dart';
import 'row_column.dart';
import 'stack_position.dart';
import 'tugas.dart';
import 'tes.dart';
import 'tugaspakarifin.dart';
import 'tgspakarifin3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: //ScaffoldWidget(),
            //Dialog()
            //RowColumn()
            //StackPosition()
            Tugas()
                    //Tes()
        //Tugaspakarifin()
        );
  }
}
