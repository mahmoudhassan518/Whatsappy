import 'package:intl/intl.dart';

class LinksHistory {
  LinksHistory(
      {
      this.countryFlagUri = "flags/eg.png",
      this.countryName = "مصر",
      this.countryCode = "EG",
      this.countryDialCode = "+20",
      this.dateTime = "",
      this.number = "",
      this.fullNumber=""});

  String countryFlagUri;
  String countryName;
  String countryCode;
  String countryDialCode;

  String dateTime;
  String number;

  String fullNumber;


  Map<String, dynamic> toJson() {
    return {
      "countryFlagUri": this.countryFlagUri,
      "countryName": this.countryName,
      "countryCode": this.countryCode,
      "countryDialCode": this.countryDialCode,
      "dateTime": this.dateTime,
      "number": this.number,
      "fullNumber": this.fullNumber,
    };
  }

  String? getCurrentTime() => DateFormat('dd/MM/yyyy hh:mm:a').format(DateTime.now());
}
