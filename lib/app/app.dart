import 'package:flutter/material.dart';
import 'package:health/core/globals.dart';
import 'package:health/services/routes/router.dart';

// Alice alice = Alice(showNotification: kDebugMode);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // alice.setNavigatorKey(navigatorKey);
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,

      routerConfig: NavigationRouter.router,
      //  home:  HomeView(qrCode: "8901063242029"),
    );
  }
}
