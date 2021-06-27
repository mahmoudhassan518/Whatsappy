import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/NumberObject.dart';

class TemplatesEntityMapper extends Mapper<TemplatesEntityData, NumberObject> {
  @override
  TemplatesEntityData mapFromDomainModel(NumberObject domain) =>
      TemplatesEntityData(
          dateTimes: domain.dateTime,
          message: domain.message,
          id: domain.id,
          isNewTemplate: domain.isNewTemplate);

  @override
  NumberObject mapToDomainModel(TemplatesEntityData template) => NumberObject(
      dateTime: template.dateTimes,
      message: template.message,
      id: template.id,
      isNewTemplate: template.isNewTemplate);

  List<NumberObject> mapToDomainList(List<TemplatesEntityData> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<TemplatesEntityData> mapFromDomainList(List<NumberObject> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
