import 'package:whatsappy/core/Mapper.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/domain/models/TemplatesHistoryItem.dart';

class TemplatesEntityMapper extends Mapper<Template, TemplatesHistory> {
  @override
  Template mapFromDomainModel(TemplatesHistory domain) => Template(
      dateTimes: domain.dateTime,
      message: domain.message,
      id: domain.id,
      isNewTemplate: domain.isNewTemplate);

  @override
  TemplatesHistory mapToDomainModel(Template template) => TemplatesHistory(
      dateTime: template.dateTimes,
      message: template.message,
      id: template.id,
      isNewTemplate: template.isNewTemplate);

  List<TemplatesHistory> mapToDomainList(List<Template> list) =>
      list.map((e) => mapToDomainModel(e)).toList();

  List<Template> mapFromDomainList(List<TemplatesHistory> list) =>
      list.map((e) => mapFromDomainModel(e)).toList();
}
