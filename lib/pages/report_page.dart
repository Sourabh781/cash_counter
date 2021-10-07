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
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
            child: Text(
          "CASH COUNTER",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // Container(
              //   padding: EdgeInsets.all(16),
              //   alignment: Alignment.topRight,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Icon(
              //         Icons.share_rounded,
              //         size: 40,
              //         color: Colors.black87,
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Icon(
              //         Icons.save_rounded,
              //         size: 40,
              //         color: Colors.black87,
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Card(
                margin: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Container(
                    height: height * 1 / 2,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width / 60),
                          child: Text(
                            formattedDate,
                            style: TextStyle(
                                fontSize: width / 24,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
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
                                        color: Colors.orange),
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
                                              color: Colors.orange))),
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
                                              color: Colors.orange))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(3)),
                            margin: EdgeInsets.only(
                                left: width / 35,
                                top: width / 42,
                                right: width / 25),
                            height: height / 14,
                            child: ListView(
                              padding: EdgeInsets.all(8),
                              scrollDirection: Axis.horizontal,
                              children: [
                                (rt.nt.noOfNotes("2000") > 0)
                                    ? NoOfNote(rt: rt, label: '2000')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("500") > 0)
                                    ? NoOfNote(rt: rt, label: '500')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("200") > 0)
                                    ? NoOfNote(rt: rt, label: '200')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("100") > 0)
                                    ? NoOfNote(rt: rt, label: '100')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("50") > 0)
                                    ? NoOfNote(rt: rt, label: '50')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("10") > 0)
                                    ? NoOfNote(rt: rt, label: '10')
                                    : Container(),
                                SizedBox(
                                  width: 20,
                                ),
                                (rt.nt.noOfNotes("5") > 0)
                                    ? NoOfNote(rt: rt, label: '5')
                                    : Container(),
                              ],
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        toWords(width)
                      ],
                    )),
              ),

              InkWell(
                onTap: () async {
                  DatabaseHelper.instance.insert({
                    DatabaseHelper.creationDate: rt.dateTime.toString(),
                    DatabaseHelper.totalAmount: rt.cn.total() + rt.nt.total()
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  height: height / 15.7,
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
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 117),
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
      margin:
          EdgeInsets.only(left: width / 35, top: width / 42, right: width / 25),
      child: Text(
        NumberToWord()
            .convert('en-in', rt.cn.total() + rt.nt.total())
            .toString()
            .toUpperCase(),
        style: TextStyle(
            fontSize: width / 27,
            fontWeight: FontWeight.bold,
            color: Colors.green),
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
    return Row(
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
    );
  }
}
