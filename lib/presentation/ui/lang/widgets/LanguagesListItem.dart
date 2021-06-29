import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:whatsappy/domain/models/LanguageData.dart';
import 'package:whatsappy/presentation/ui/lang/LanguageController.dart';
import 'package:whatsappy/presentation/utils/resources/Colors.dart';
import 'package:whatsappy/presentation/utils/resources/Sizes.dart';

// ignore: must_be_immutable
class LanguagesListItem extends StatelessWidget {
  LanguageData item;
  LanguageController _controller;

  LanguagesListItem(this.item, this._controller);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _controller.updateLocale(item);
      },
      child: Padding(
        padding: const EdgeInsets.all(generalPadding),
        child: Row(
          children: [

            CountryPickerUtils.getDefaultFlagImage(Country(
                isoCode: item.countryCode,
                name: '',
                iso3Code: '',
                phoneCode: '')),

            SizedBox(
              width: generalPadding,
            ),
            Expanded(
              child: Text(
                "${item.value}",
                style: TextStyle(
                    fontSize: h4,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Align(
                alignment: Alignment.centerRight, child: _checkItemStatus(item)),
          ],
        ),
      ),
    );
  }

  Widget _checkItemStatus(LanguageData item) {
    if (item.isChecked)
      return Icon(
        Icons.check,
        color: colorPrimary,
      );
    else
      return SizedBox.shrink();
  }
}
