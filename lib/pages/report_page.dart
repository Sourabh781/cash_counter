import 'package:cash_counter/model/database_helper.dart';
import 'package:cash_counter/model/report.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';

class ReportPage extends StatelessWidget {
  ReportPage({this.rt});
  final Report rt;

  // double height;
  // double width;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String formattedDate = DateFormat('dd-MM-yyyy').format(rt.dateTime);
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
            child: Text(
          "CASH COUNTER",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: width / 22),
        )),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Container(
                    height: height * 1 / 2,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width / 60),
                          child: Center(
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                  fontSize: width / 24,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width / 35,
                              top: width / 42,
                              right: width / 25),
                          child: Table(
                            border: TableBorder.all(width: 1),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                        child: Text(
                                      "TOTAL CASH IN NOTES",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    )),
                                  ),
                                  Center(
                                      child: Text(
                                    (rt.nt.total().toString()),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown),
                                  )),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "TOTAL CASH IN COINS",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  )),
                                  Center(
                                      child: Text((rt.cn.total().toString()),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown))),
                                ],
                              ),
                              TableRow(
                                children: <Widget>[
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "TOTAL CASH",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  )),
                                  Center(
                                      child: Text(
                                          ((rt.nt.total() + rt.cn.total())
                                              .toString()),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.brown))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 63,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width / 35),
                          child: Text(
                            'Notes Count',
                            style: TextStyle(
                                fontSize: width / 35,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.brown[200],
                              borderRadius: BorderRadius.circular(3)),
                          margin: EdgeInsets.only(
                              left: width / 35, right: width / 25),
                          height: height / 14,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              (rt.nt.noOfNotes("2000") > 0)
                                  ? NoOfNote(rt: rt, label: '2000')
                                  : Container(),
                              (rt.nt.noOfNotes("500") > 0)
                                  ? NoOfNote(rt: rt, label: '500')
                                  : Container(),
                              (rt.nt.noOfNotes("200") > 0)
                                  ? NoOfNote(rt: rt, label: '200')
                                  : Container(),
                              (rt.nt.noOfNotes("100") > 0)
                                  ? NoOfNote(rt: rt, label: '100')
                                  : Container(),
                              (rt.nt.noOfNotes("50") > 0)
                                  ? NoOfNote(rt: rt, label: '50')
                                  : Container(),
                              (rt.nt.noOfNotes("20") > 0)
                                  ? NoOfNote(rt: rt, label: '20')
                                  : Container(),
                              (rt.nt.noOfNotes("10") > 0)
                                  ? NoOfNote(rt: rt, label: '10')
                                  : Container(),
                              (rt.nt.noOfNotes("5") > 0)
                                  ? NoOfNote(rt: rt, label: '5')
                                  : Container(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: width / 35, top: width / 25),
                          child: Text(
                            'Coins Count',
                            style: TextStyle(
                                fontSize: width / 35,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.brown[200],
                                borderRadius: BorderRadius.circular(3)),
                            margin: EdgeInsets.only(
                              left: width / 35,
                              right: width / 25,
                            ),
                            height: height / 14,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                (rt.cn.noOfNotes("10") > 0)
                                    ? NoOfCoin(rt: rt, label: '10')
                                    : Container(),
                                (rt.cn.noOfNotes("5") > 0)
                                    ? NoOfCoin(rt: rt, label: '5')
                                    : Container(),
                                (rt.cn.noOfNotes("2") > 0)
                                    ? NoOfCoin(rt: rt, label: '2')
                                    : Container(),
                                (rt.cn.noOfNotes("1") > 0)
                                    ? NoOfCoin(rt: rt, label: '1')
                                    : Container(),
                              ],
                            )),
                        SizedBox(
                          height: height / 63,
                        ),
                        toWords(width)
                      ],
                    )),
              ),
              Container(
                child: InkWell(
                  onTap: () async {
                    DatabaseHelper.instance.insert({
                      DatabaseHelper.creationDate: DateFormat('dd-MM-yyyy')
                          .format(rt.dateTime)
                          .toString(),
                      DatabaseHelper.totalAmount: rt.cn.total() + rt.nt.total(),
                      DatabaseHelper.ntwoThousand: rt.nt.twoThousand,
                      DatabaseHelper.nfiveHundred: rt.nt.fiveHundred,
                      DatabaseHelper.ntwoHundred: rt.nt.twoHundred,
                      DatabaseHelper.nhundred: rt.nt.hundred,
                      DatabaseHelper.nfifty: rt.nt.fifty,
                      DatabaseHelper.ntwenty: rt.nt.twenty,
                      DatabaseHelper.nten: rt.nt.ten,
                      DatabaseHelper.nfive: rt.nt.five,
                      DatabaseHelper.cten: rt.cn.ten,
                      DatabaseHelper.cfive: rt.cn.five,
                      DatabaseHelper.ctwo: rt.cn.two,
                      DatabaseHelper.cone: rt.cn.one,
                    });

                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: height / 63, left: width / 42, right: width / 42),
                    height: height / 17,
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width / 21),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.brown[800],
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
      ),
    );
  }

  Container toWords(double width) {
    return Container(
      padding:
          EdgeInsets.only(left: width / 35, top: width / 42, right: width / 25),
      child: Text(
        NumberToWord()
            .convert('en-in', rt.cn.total() + rt.nt.total())
            .toString()
            .toUpperCase(),
        style: TextStyle(
            fontSize: width / 27,
            fontWeight: FontWeight.bold,
            color: Colors.brown),
      ),
    );
  }
}

class NoOfNote extends StatelessWidget {
  NoOfNote({this.rt, this.label});
  final String label;
  final Report rt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            (rt.nt.noOfNotes(label)).toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            ' X ',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black45)),
        ],
      ),
    );
  }
}

class NoOfCoin extends StatelessWidget {
  NoOfCoin({this.rt, this.label});
  final String label;
  final Report rt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            (rt.cn.noOfNotes(label)).toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            ' X ',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black45)),
        ],
      ),
    );
  }
}
