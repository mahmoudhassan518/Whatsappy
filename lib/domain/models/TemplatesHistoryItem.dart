import 'package:intl/intl.dart';

class TemplatesHistoryItem {
  String message = "My account information to transfer the amount agreed upon is:count number:  xxxxxxxxxIBAN: xxxxxxxxxxxxxxxxxxxxxxxThank you";
  String firstLine = "";
  String remainsLines = "";
  String dateTime =  DateFormat('dd/MM/yyyy kk:mm:a').format(DateTime.now());



}
