import 'package:cash_counter/model/coins.dart';
import 'package:cash_counter/model/notes.dart';

class Report {
  Coins cn;
  Notes nt;
  DateTime dateTime;

  Report({this.cn, this.nt, this.dateTime});
}
