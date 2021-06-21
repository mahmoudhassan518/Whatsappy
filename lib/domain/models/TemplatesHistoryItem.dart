import 'package:intl/intl.dart';

class TemplatesHistory {
  String message = "";
  String dateTime = "";
  int id;
  bool isNewTemplate;

  TemplatesHistory(
      {this.message = "",
      this.dateTime = "",
      this.id = 0,
      this.isNewTemplate = true});

  Map<String, dynamic> toJson() {
    return {
      "message": this.message,
      "dateTime": this.dateTime,
    };
  }

  String getCurrentTime() =>
      DateFormat('dd/MM/yyyy hh:mm:a').format(DateTime.now());
}
