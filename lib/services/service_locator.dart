import 'package:get_it/get_it.dart';

import 'storage/hive_storage_service.dart';
import 'storage/storage_service.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<StorageService>(HiveStorageService());
}
