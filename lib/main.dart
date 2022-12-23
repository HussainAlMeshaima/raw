import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:raw/app/locator/locator.dart';
import 'package:raw/app/services/router_service.dart';
import 'package:raw/app/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Logger.level = Level.debug;
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouterService routerService = locator<RouterService>();

    return MaterialApp.router(
      title: 'Aaab',
      theme: AppThemes().lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: routerService.router.delegate(),
      routeInformationParser: routerService.router.defaultRouteParser(),
    );
  }
}
