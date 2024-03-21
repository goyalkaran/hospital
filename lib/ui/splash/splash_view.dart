import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/ui/splash/splash_viewModel.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(splashViewModelProvider).navigateToHomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(alignment: Alignment.center, child: const Text("My Health App")),
    );
  }
}
