import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swachhta_app2/profile/profile_screen.dart';
import 'package:swachhta_app2/worker/screen/complaint.dart';
import 'package:swachhta_app2/worker/screen/home_screen_worker.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =  HomeScreenWorker();

    //var activePageTitle = 'HomeScreenWorker';
    if (_selectedPageIndex == 1) {
      activePage = Complaint();

    }

    if (_selectedPageIndex == 2) {
      activePage = const ProfileScreen();
      //activePageTitle = 'Profile';
    }

    return Scaffold(

      body: activePage,


      bottomNavigationBar: FluidNavBar(
        defaultIndex: 0,
          icons: [
            FluidNavBarIcon(
                icon: Icons.home, backgroundColor: const Color(0xFF4285F4)),
            FluidNavBarIcon(
                icon: Icons.message, backgroundColor: const Color(0xFFEC4134)),
            FluidNavBarIcon(
                icon: Icons.person, backgroundColor: const Color(0xFFEC4134)),
          ],
          onChange: _selectPage,
          style: const FluidNavBarStyle(
              iconBackgroundColor: Colors.black,
              barBackgroundColor: Colors.lightBlueAccent,
              iconUnselectedForegroundColor: Colors.grey)),
    );
  }
}
