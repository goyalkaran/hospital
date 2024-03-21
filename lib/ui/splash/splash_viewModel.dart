import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/core/base_view_model.dart';
import 'package:health/services/routes/router.dart';
import 'package:health/services/routes/routes_constants.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel();

  navigateToHomeView() async {
    await Future.delayed(Duration(seconds: 1));
    NavigationRouter.pushNamedAndRemoveUntil(Routes.dashboardView);
  }
}

final splashViewModelProvider =
    ChangeNotifierProvider((ref) => SplashViewModel());
