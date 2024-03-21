import 'dart:core';

import 'package:go_router/go_router.dart';
import 'package:health/core/globals.dart';
import 'package:health/services/routes/routes_constants.dart';
import 'package:health/ui/dashboard/dashboard_view.dart';
import 'package:health/ui/splash/splash_view.dart';

class NavigationRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: '/',
          name: Routes.splashView,
          builder: (context, state) {
            return SplashView();
          }),
      GoRoute(
          path: '/dashboard-view',
          name: Routes.dashboardView,
          builder: (context, state) {
            return DashboardView();
          }),

    ],
    debugLogDiagnostics: true,
    // errorPageBuilder: (context, state) {
    //   return MaterialPage(child: ErrorView());
    // }
  );

  static void popUntil(Uri name) {
    Uri? currentRoute = router.routeInformationProvider.value.uri;
    while (router.canPop() && name != currentRoute) {
      currentRoute = router.routeInformationProvider.value.uri;
      if (name != currentRoute) {
        router.pop();
      }
    }
  }

  static void pushNamedAndRemoveUntil(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    while (router.canPop()) {
      router.pop();
    }
    router.replaceNamed(name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }
}
