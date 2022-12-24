import 'package:flutter/material.dart';
    import 'package:raw/app/locator/locator.dart';
    import 'package:raw/app/services/router_service.dart';

class RawApp extends StatelessWidget {
  const RawApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RouterService _routerService = locator<RouterService>();

    return MaterialApp.router(
      title: "Raw",
      routeInformationParser: _routerService.router.defaultRouteParser(),
      routerDelegate: _routerService.router.delegate(),
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}