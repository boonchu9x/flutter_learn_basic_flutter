import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeNumberFormatScreen extends StatefulWidget {
  @override
  _DateTimeNumberFormatScreenState createState() => _DateTimeNumberFormatScreenState();
}

class _DateTimeNumberFormatScreenState extends State<DateTimeNumberFormatScreen> {
  DateTime dateTimeNow = new DateTime.now(); //get date time now
  DateTime someDate = new DateTime(2020, 12, 03); //date time custom

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Learn Basic',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Show Date, Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              NumberFormat('###.0#', 'en_US').format(12.34567),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
