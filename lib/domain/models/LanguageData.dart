class LanguageData {
  String code;
  String value;
  bool isChecked;
  String countryCode;


  LanguageData(
      {this.code = 'en', this.value = 'English', this.isChecked = false, this.countryCode = 'US'});


  static List<LanguageData> getLanguagesData() {

    List<LanguageData> data = [];

    data.add(LanguageData( code: 'en', value: 'English', isChecked: false, countryCode: 'US'));
    data.add(LanguageData( code: 'ar', value: 'العربية', isChecked: false, countryCode: 'SA'));

    return data;

  }


  factory LanguageData.fromJson(Map<String, dynamic> json) {
    return LanguageData(
      code: json["code"],
      value: json["value"],
      isChecked: json["isChecked"],
      countryCode: json["countryCode"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "value": this.value,
      "isChecked": this.isChecked,
      "countryCode": this.countryCode,
    };
  }

  static String provideLanguage(String? code) {
    switch (code) {
      case null:
        return 'English';
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
      default:
        return 'English';
    }
  }
}


