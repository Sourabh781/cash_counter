import 'package:cash_counter/model/coins.dart';
import 'package:cash_counter/model/notes.dart';
import 'package:cash_counter/model/report.dart';
import 'package:cash_counter/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCount extends StatefulWidget {
  @override
  _NewCountState createState() => _NewCountState();
}

class _NewCountState extends State<NewCount> {
  Notes nt = Notes();
  Coins cn = Coins();
  Report rt = Report();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white12),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, top: 10, right: 12),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total case in notes',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs.${nt.total().toString()}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              ],
            ),
          ),
          notesCard(),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total case in coins',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs.${cn.total().toString()}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              ],
            ),
          ),
          coinsCard(),
          Container(
            margin: EdgeInsets.only(left: 12, top: 5, right: 12),
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total case count',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs.${(cn.total() + nt.total()).toString()}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                height: 60,
                child: Center(
                  child: Text(
                    'GENERATE REPORT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding notesCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '2000',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.twoThousand.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '500',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.fiveHundred.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '200',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.twoHundred.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '100',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.hundred.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '50',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.fifty.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '20',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.twenty.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '10',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.ten.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '5',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${nt.five.toString()}",
                      style: TextStyle(
                          fontSize: 16,
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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '10',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${cn.ten.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '5',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${cn.five.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '2',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${cn.two.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRow(
                    value: '1',
                  ),
                  SizedBox(
                    width: 90,
                    height: 35,
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
                        fontSize: 33,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "Rs.${cn.one.toString()}",
                      style: TextStyle(
                          fontSize: 16,
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

class CustomRow extends StatelessWidget {
  CustomRow({this.value});
  final String value;
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
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'X',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
