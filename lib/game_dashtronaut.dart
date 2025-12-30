import 'package:flutter/material.dart';
import 'app.dart';
import 'services/service_locator.dart';
import 'services/storage/storage_service.dart';

class GameDashtronaut extends StatefulWidget {
  const GameDashtronaut({super.key});

  @override
  State<GameDashtronaut> createState() => _GameDashtronautState();
}

class _GameDashtronautState extends State<GameDashtronaut> {
  StorageService? storageService;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initPackage();
  }

  Future<void> _initPackage() async {
    setupServiceLocator();
    final service = getIt<StorageService>();
    await service.init();
    setState(() {
      storageService = service;
      isLoading = false;
    });
  }

  void reset() async {
    await getIt.reset();
  }

  @override
  void dispose() {
    reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Center(
        child: App(storageService: storageService!),
      ),
    );
  }
}
