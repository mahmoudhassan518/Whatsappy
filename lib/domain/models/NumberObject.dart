import 'package:intl/intl.dart';

class NumberObject {
  NumberObject(
      {this.countryFlagUri = "flags/eg.png",
      this.countryName = "مصر",
      this.countryCode = "EG",
      this.countryDialCode = "+20",
      this.dateTime = "",
      this.number = "",
      this.fullNumber = "",
      this.message = "",
      this.id = 0,
      this.isNewTemplate = true});

  String countryFlagUri;
  String countryName;
  String countryCode;
  String countryDialCode;

  String dateTime;
  String number;

  String fullNumber;

  String message = "";
  int id;
  bool isNewTemplate;

  Map<String, dynamic> toJson() {
    return {
      "countryFlagUri": this.countryFlagUri,
      "countryName": this.countryName,
      "countryCode": this.countryCode,
      "countryDialCode": this.countryDialCode,
      "dateTime": this.dateTime,
      "number": this.number,
      "fullNumber": this.fullNumber,
      "message": this.message,
      "id": this.id,
      "isNewTemplate": this.isNewTemplate,
    };
  }

  String getCurrentTime() =>
      DateFormat('dd/MM/yyyy hh:mm:a').format(DateTime.now());
}
