import 'package:get_it/get_it.dart';
import 'package:whatsappy/data/datasource/locale/db/MyDatabase.dart';
import 'package:whatsappy/data/repositories/ChatsRepositoryImpl.dart';
import 'package:whatsappy/data/repositories/DBRepositoryImpl.dart';
import 'package:whatsappy/data/repositories/WhatsAppRepositoryImpl.dart';
import 'package:whatsappy/domain/repositories/ChatsRepository.dart';
import 'package:whatsappy/domain/repositories/DBRepository.dart';
import 'package:whatsappy/domain/repositories/WhatsAppRepository.dart';
import 'package:whatsappy/domain/usecases/ClearChatHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/ClearLinksHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/ClearTemplateHistoryFromDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertChatHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertLinksHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/InsertTemplateHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithOnlyMessageUseCase.dart';
import 'package:whatsappy/domain/usecases/OpenWhatsAppWithSingleNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/UpdateTemplateHistoryToDBUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateChatsIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/ValidateLinksIsRealNumberUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchChatHistoryUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchLinksHistoryUseCase.dart';
import 'package:whatsappy/domain/usecases/WatchTemplatesHistoryUseCase.dart';

GetIt getIt = GetIt.instance;

configureInjector() {
  getIt.registerSingleton<MyDatabase>(MyDatabase());

  getIt.registerSingleton<DBRepository>(DBRepositoryImpl(getIt<MyDatabase>()));
  getIt.registerSingleton<WhatsAppRepository>(WhatsAppRepositoryImpl());
  getIt.registerSingleton<ChatsRepository>(ChatsRepositoryImpl());

  getIt.registerSingleton<ClearChatHistoryFromDBUseCase>(
      ClearChatHistoryFromDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<InsertChatHistoryToDBUseCase>(
      InsertChatHistoryToDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<ValidateChatsIsRealNumberUseCase>(
      ValidateChatsIsRealNumberUseCase(getIt<ChatsRepository>()));

  getIt.registerSingleton<ValidateLinksIsRealNumberUseCase>(
      ValidateLinksIsRealNumberUseCase(getIt<ChatsRepository>()));

  getIt.registerSingleton<WatchChatHistoryUseCase>(
      WatchChatHistoryUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<WatchTemplatesHistoryUseCase>(
      WatchTemplatesHistoryUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<InsertTemplateHistoryToDBUseCase>(
      InsertTemplateHistoryToDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<OpenWhatsAppWithOnlyMessageUseCase>(
      OpenWhatsAppWithOnlyMessageUseCase(getIt<WhatsAppRepository>()));

  getIt.registerSingleton<ClearTemplateHistoryFromDBUseCase>(
      ClearTemplateHistoryFromDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<UpdateTemplateHistoryToDBUseCase>(
      UpdateTemplateHistoryToDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<OpenWhatsAppWithSingleNumberUseCase>(
      OpenWhatsAppWithSingleNumberUseCase(getIt<WhatsAppRepository>()));

  getIt.registerSingleton<InsertLinksHistoryToDBUseCase>(
      InsertLinksHistoryToDBUseCase(getIt<DBRepository>()));

  getIt.registerSingleton<WatchLinksHistoryUseCase>(
      WatchLinksHistoryUseCase(getIt<DBRepository>()));


  getIt.registerSingleton<ClearLinksHistoryFromDBUseCase>(
      ClearLinksHistoryFromDBUseCase(getIt<DBRepository>()));

}
