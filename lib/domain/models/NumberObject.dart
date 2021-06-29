import 'package:intl/intl.dart';

class NumberObject {
  NumberObject(
      {this.dateTime = "",
      this.number = "",
      this.message = "",
      this.dialCode = "",
      this.isoCode = "",
      this.id = 0,
      this.isNewTemplate = true});

  String dateTime;
  String isoCode;
  String dialCode;
  String number;
  String message = "";
  int id;
  bool isNewTemplate;

  String getCurrentTime() =>
      DateFormat('dd/MM/yyyy hh:mm:a').format(DateTime.now());

  Map<String, dynamic> toJson() {
    return {
      "dateTime": this.dateTime,
      "isoCode": this.isoCode,
      "dialCode": this.dialCode,
      "number": this.number,
      "message": this.message,
      "id": this.id,
      "isNewTemplate": this.isNewTemplate,
    };
  }
}
