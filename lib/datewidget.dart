import 'package:flutter/material.dart';

class Datewidget extends StatefulWidget {
  const Datewidget({super.key, this.title});
  final String? title;

  @override
  State<Datewidget> createState() => _DatewidgetState();
}

class _DatewidgetState extends State<Datewidget> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2008, 04),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title != null ? widget.title! : 'Select Date',
            style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () => {
                _selectDate(context),
                print(
                  'selectedDate.day	+	selectedDate.month	+ selectedDate.year',
                )
                }, 
                child: Text('Select Date'),
            )
            ],
            ),
      );
  }
}

