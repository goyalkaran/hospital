import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/ui/dashboard/heart/heart_view.dart';
import 'package:health/ui/dashboard/home/home_view.dart';
import 'package:health/ui/dashboard/notification/notification_view.dart';
import 'package:health/ui/dashboard/profile/profile_view.dart';

import 'dashboard_viewModel.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  DateTime? backButtonPressTime;

  late DashboardViewModel _viewModel;

  final List<Widget> _tabs = [
    const HomeView(),
    const NotificationView(),
    const HeartView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(dashboardViewModelProvider);
    return Scaffold(
      body: _tabs[_viewModel.tabIndex],
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xFFDADADA),
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, -2)),
        ],
      ),
      child: BottomNavigationBar(
          backgroundColor: Color(0xFF135297),
          type: BottomNavigationBarType.fixed,
          currentIndex: _viewModel.tabIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Heart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          onTap: (index) async {
            await _viewModel.selectedTab(index);
          }),
    );
  }
}
