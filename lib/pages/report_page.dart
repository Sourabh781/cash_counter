import 'package:cash_counter/model/report.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  ReportPage({this.rt});
  final Report rt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Center(
            child: Text(
          "CASH COUNTER",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              child: Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      rt.dateTime.toString(),
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
