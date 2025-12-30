import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app.dart';
import 'services/service_locator.dart';
import 'services/storage/storage_service.dart';

void main() {
  usePathUrlStrategy();
  setupServiceLocator();
  runZonedGuarded<Future<void>>(() async {
    final StorageService storageService = getIt<StorageService>();
    await storageService.init();

    runApp(App(storageService: storageService));
  }, (e, _) => throw e);
}
