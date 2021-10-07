import 'package:cash_counter/model/coins.dart';
import 'package:cash_counter/model/notes.dart';
import 'package:cash_counter/model/report.dart';
import 'package:cash_counter/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:number_to_words/number_to_words.dart';

class NewCount extends StatefulWidget {
  @override
  _NewCountState createState() => _NewCountState();
}

class _NewCountState extends State<NewCount> {
  Notes nt = Notes();
  Coins cn = Coins();
  Report rt = Report();
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: cn.total().toDouble() + nt.total().toDouble());
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CASH COUNTER",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width / 105)),
              child: Padding(
                padding: EdgeInsets.all(height / 117),
                child: Text(
                  "Rs.${fmf.output.withoutFractionDigits}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white12),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: width / 35, top: width / 42, right: width / 25),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total case in notes',
                    style: TextStyle(
                        fontSize: width / 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rs.${nt.total().toString()}",
                    style: TextStyle(
                        fontSize: width / 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  )
                ],
              ),
            ),
            notesCard(),
            Container(
              margin: EdgeInsets.only(left: width / 35, right: width / 35),
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total case in coins',
                    style: TextStyle(
                        fontSize: width / 30, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Rs.${cn.total().toString()}",
                    style: TextStyle(
                        fontSize: width / 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  )
                ],
              ),
            ),
            coinsCard(),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: width / 35, top: width / 42, right: width / 25),
                child: Text(
                  NumberToWord()
                      .convert('en-in', cn.total() + nt.total())
                      .toString()
                      .toUpperCase(),
                  style: TextStyle(
                      fontSize: width / 26.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: width / 42, right: width / 42, top: width / 21),
              child: InkWell(
                onTap: () {
                  rt.cn = cn;
                  rt.nt = nt;
                  rt.dateTime = DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportPage(
                        rt: rt,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: height / 15.7,
                  child: Center(
                    child: Text(
                      'GENERATE REPORT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 21),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 117),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding notesCard() {
    return Padding(
      padding: EdgeInsets.all(width / 117),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(width / 117),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '2000',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.twoThousand = 0;
                          });
                        }
                        setState(() {
                          nt.twoThousand = 2000 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.twoThousand.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '500',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.fiveHundred = 0;
                          });
                        }
                        setState(() {
                          nt.fiveHundred = 500 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.fiveHundred.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '200',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.twoHundred = 0;
                          });
                        }
                        setState(() {
                          nt.twoHundred = 200 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.twoHundred.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '100',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.hundred = 0;
                          });
                        }
                        setState(() {
                          nt.hundred = 100 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.hundred.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '50',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.fifty = 0;
                          });
                        }
                        setState(() {
                          nt.fifty = 50 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.fifty.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '20',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.twenty = 0;
                          });
                        }
                        setState(() {
                          nt.twenty = 20 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.twenty.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '10',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.ten = 0;
                          });
                        }
                        setState(() {
                          nt.ten = 10 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.ten.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 188.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '5',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            nt.five = 0;
                          });
                        }
                        setState(() {
                          nt.five = 5 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${nt.five.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding coinsCard() {
    return Padding(
      padding: EdgeInsets.all(width / 117),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(width / 117),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '10',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            cn.ten = 0;
                          });
                        }
                        setState(() {
                          cn.ten = 10 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${cn.ten.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width / 84.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '5',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            cn.five = 0;
                          });
                        }
                        setState(() {
                          cn.five = 5 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${cn.five.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width / 84.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '2',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            cn.two = 0;
                          });
                        }
                        setState(() {
                          cn.two = 2 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.2,
                    child: Text(
                      "Rs.${cn.two.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width / 84.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '1',
                  ),
                  SizedBox(
                    width: width / 4.7,
                    height: height / 26.8,
                    child: TextField(
                      onChanged: (n) {
                        if (n.isEmpty) {
                          setState(() {
                            cn.one = 0;
                          });
                        }
                        setState(() {
                          cn.one = 1 * int.parse(n);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '=',
                    style: TextStyle(
                        fontSize: height / 27,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: width / 4.23,
                    child: Text(
                      "Rs.${cn.one.toString()}",
                      style: TextStyle(
                          fontSize: width / 26.5,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatefulWidget {
  CustomRow({
    this.value,
  });
  final String value;

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  double height = 0;

  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: width / 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: width / 8.4,
            child: Text(
              widget.value,
              style: TextStyle(
                  fontSize: width / 23.5, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'X',
            style: TextStyle(
                fontSize: width / 21,
                fontWeight: FontWeight.w900,
                color: Colors.red),
          ),
        ],
      ),
    );
  }
}
