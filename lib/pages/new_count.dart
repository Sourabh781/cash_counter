import 'package:cash_counter/model/coins.dart';
import 'package:cash_counter/model/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCount extends StatefulWidget {
  @override
  _NewCountState createState() => _NewCountState();
}

class _NewCountState extends State<NewCount> {
  Notes nt;
  Coins cn;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white12),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'NOTES',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomRow(
                      value: '2000',
                    ),
                    CustomRow(
                      value: '500',
                    ),
                    CustomRow(
                      value: '200',
                    ),
                    CustomRow(
                      value: '100',
                    ),
                    CustomRow(
                      value: '50',
                    ),
                    CustomRow(
                      value: '20',
                    ),
                    CustomRow(
                      value: '10',
                    ),
                    CustomRow(
                      value: '5',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomRow extends StatefulWidget {
  CustomRow({this.value});
  final String value;

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              widget.value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'X',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.red),
          ),
          SizedBox(
              width: 90,
              height: 35,
              child: TextField(
                onChanged: (n) {
                  if (n.isEmpty) {
                    setState(() {
                      amount = 0;
                    });
                  }
                  setState(() {
                    amount = int.parse(widget.value) * int.parse(n);
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2.0),
                  ),
                ),
              )),
          Text(
            '=',
            style: TextStyle(
                fontSize: 33, fontWeight: FontWeight.w900, color: Colors.red),
          ),
          SizedBox(
            width: 100,
            child: Text(
              "Rs.${amount.toString()}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
