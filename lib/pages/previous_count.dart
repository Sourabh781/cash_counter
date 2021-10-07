import 'package:cash_counter/model/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const kEmail = "duoatokays@gmail.com";

class PreviousCount extends StatefulWidget {
  PreviousCount({this.queryRows});
  final List<Map<String, dynamic>> queryRows;
  @override
  _PreviousCountState createState() => _PreviousCountState();
}

class _PreviousCountState extends State<PreviousCount> {
  double height = 0;
  double width = 0;

  _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: kEmail,
      // queryParameters: {
      //   'subject': 'Example Subject & Symbols are allowed!'
      // }
    );
// mailto:smith@example.com?subject=Example+Subject+%26+Symbols+are+allowed%21
    launch(_emailLaunchUri.toString());
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "CASH COUNTER",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

                // Text("CREDITS:"),
                // creditThing(webSiteName: "freepik",msg: "for free resources",url: "https://www.freepik.com/free-photos-vectors/study"),
                // creditThing(webSiteName: "BeFonts ",msg: "for free Fonts", url: "https://befonts.com/lot-font.html"),
              ],
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Container(
              height: 40,
              color: Colors.red,
              child: InkWell(
                onTap: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DatabaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text('press for previous records'),
              ),
            ),
          ),
        ));
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
    return Text(
      "Previous reports will be shown here.",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: width / 26.5,
          color: Colors.black54),
    );
  }
}
