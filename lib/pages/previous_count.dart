import 'package:cash_counter/model/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:url_launcher/url_launcher.dart';

const kEmail = "duoatokays@gmail.com";

class PreviousCount extends StatefulWidget {
  @override
  _PreviousCountState createState() => _PreviousCountState();
}

class _PreviousCountState extends State<PreviousCount> {
  List<Map<String, dynamic>> queryRows = [];
  bool isloading;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    isloading = true;

    queryRows = await DatabaseHelper.instance.queryAll();
    print(queryRows);
    setState(() {
      isloading = false;
    });
  }

  _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: kEmail,
    );
// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
    launch(_emailLaunchUri.toString());
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[900],
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CASH COUNTER",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width / 20),
              ),
              Image.asset(
                'assets/images/logo.png',
                scale: width / 70,
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.orange[50],
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Made with ♥ at",
                  style: TextStyle(fontSize: (width / 35).roundToDouble()),
                )),
                Center(
                  child: Container(
                    height: (height / 9.4).roundToDouble(),
                    width: (width / 4.2).roundToDouble(),
                    child: Image.asset('assets/images/aboutUs_logo_01.png'),
                  ),
                ),
                SizedBox(
                  height: (height / 18.8).roundToDouble(),
                ),
                Text(
                  "Contact us at :",
                  style: TextStyle(fontSize: (width / 35).roundToDouble()),
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: _launchEmail,
                  child: Text(
                    kEmail,
                    style: TextStyle(fontSize: (width / 35).roundToDouble()),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: (isloading)
            ? Center(child: CircularProgressIndicator())
            : MyStatefulWidget(
                list: queryRows,
              ));
  }
}

class Item {
  Item({this.isExpanded, this.report});

  Map<String, dynamic> report;
  bool isExpanded;
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({this.list});
  final List<Map<String, dynamic>> list;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> generateItems() {
    return List<Item>.generate(widget.list.length, (int index) {
      return Item(
        report: widget.list[index],
        isExpanded: false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    temp = generateItems();
  }

  List<Item> temp = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return (temp.isEmpty)
        ? EmptyMsg(width: width)
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: _buildPanel(height, width),
            ),
          );
  }

  Widget _buildPanel(double height, double width) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          temp[index].isExpanded = !isExpanded;
        });
      },
      children: temp.map<ExpansionPanel>((Item singleReport) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              contentPadding: EdgeInsets.all(width / 53),
              title: Text(
                singleReport.report['date'],
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black54),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      DatabaseHelper.instance.delete(singleReport.report['id']);

                      temp.removeWhere(
                          (Item currentItem) => singleReport == currentItem);
                    });
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.brown,
                  )),
            );
          },
          body: Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            padding: EdgeInsets.only(
                top: height / 59,
                bottom: height / 59,
                left: width / 53,
                right: width / 53),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Count',
                      style: TextStyle(
                          fontSize: height / 59,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rs. ${singleReport.report['totalAmount']}',
                      style: TextStyle(
                          fontSize: height / 50,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 59,
                ),
                Text(
                  'Notes Count',
                  style: TextStyle(
                      fontSize: width / 35,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height / 59),
                  decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(3)),
                  height: height / 19,
                  child: ListView(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      (singleReport.report['ntwoThousand'] > 0)
                          ? newMethod(
                              singleReport, 'ntwoThousand', 2000, height)
                          : Container(),
                      (singleReport.report['nfiveHundred'] > 0)
                          ? newMethod(singleReport, 'nfiveHundred', 500, height)
                          : Container(),
                      (singleReport.report['ntwoHundred'] > 0)
                          ? newMethod(singleReport, 'ntwoHundred', 200, height)
                          : Container(),
                      (singleReport.report['nhundred'] > 0)
                          ? newMethod(singleReport, 'nhundred', 100, height)
                          : Container(),
                      (singleReport.report['nfifty'] > 0)
                          ? newMethod(singleReport, 'nfifty', 50, height)
                          : Container(),
                      (singleReport.report['ntwenty'] > 0)
                          ? newMethod(singleReport, 'ntwenty', 20, height)
                          : Container(),
                      (singleReport.report['nten'] > 0)
                          ? newMethod(singleReport, 'nten', 10, height)
                          : Container(),
                      (singleReport.report['nfive'] > 0)
                          ? newMethod(singleReport, 'nfive', 5, height)
                          : Container(),
                    ],
                  ),
                ),
                Text(
                  'Coins Count',
                  style: TextStyle(
                      fontSize: width / 35,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: height / 59),
                  decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(3)),
                  height: height / 19,
                  child: ListView(
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      (singleReport.report['cten'] > 0)
                          ? newMethod(singleReport, 'cten', 10, height)
                          : Container(),
                      (singleReport.report['cfive'] > 0)
                          ? newMethod(singleReport, 'cfive', 5, height)
                          : Container(),
                      (singleReport.report['ctwo'] > 0)
                          ? newMethod(singleReport, 'ctwo', 2, height)
                          : Container(),
                      (singleReport.report['cone'] > 0)
                          ? newMethod(singleReport, 'cone', 1, height)
                          : Container(),
                    ],
                  ),
                ),
                toWords(singleReport.report['totalAmount'], height)
              ],
            ),
          ),
          isExpanded: singleReport.isExpanded,
        );
      }).toList(),
    );
  }

  Container toWords(int amount, double height) {
    return Container(
      child: Text(
        NumberToWord().convert('en-in', amount).toUpperCase(),
        style: TextStyle(
            fontSize: height / 59,
            fontWeight: FontWeight.bold,
            color: Colors.brown),
      ),
    );
  }

  Container newMethod(
      Item singleReport, String label, int value, double height) {
    return Container(
      padding: EdgeInsets.all(height / 117),
      child: Row(
        children: [
          Text(
            value.toString(),
            style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: height / 47),
          ),
          Text(
            'X',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          Text(
            ((singleReport.report[label]) / value).ceil().toString(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: height / 67,
                color: Colors.black45),
          )
        ],
      ),
    );
  }
}

class EmptyMsg extends StatelessWidget {
  const EmptyMsg({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Previous reports will be shown here.",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width / 26.5,
            color: Colors.black54),
      ),
    );
  }
}
