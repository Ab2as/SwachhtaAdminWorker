import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/screen/departmentlist.dart';
import 'package:swachhta_app2/admin/screen/editProfileA.dart';
import 'package:swachhta_app2/admin/screen/home_screen_admin.dart';
import 'package:swachhta_app2/admin/screen/problemlist.dart';

class TabsScreenAdmin extends StatefulWidget {
  const TabsScreenAdmin({super.key});

  @override
  State<TabsScreenAdmin> createState() {
    return _TabsScreenAdmin();
  }
}

class _TabsScreenAdmin extends State<TabsScreenAdmin> {
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
    Widget activePage = HomeScreenAdmin();

    //var activePageTitle = 'HomeScreenWorker';
    if (_selectedPageIndex == 1) {
      activePage = DepartmentList();
    }

    if (_selectedPageIndex == 2) {
      activePage = ProblemList();
    }

    if (_selectedPageIndex == 3) {
      activePage = EditProfileA();
      //activePageTitle = 'Profile';
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: FluidNavBar(
        defaultIndex: 0,
        icons: [
          FluidNavBarIcon(
              icon: Icons.home, backgroundColor: const Color(0xFFFFFFFF)),
          FluidNavBarIcon(
              icon: Icons.list, backgroundColor: const Color(0xFFFFFFFF)),
          FluidNavBarIcon(
              icon: Icons.list_rounded,
              backgroundColor: const Color(0xFFFFFFFF)),
          FluidNavBarIcon(
              icon: Icons.person, backgroundColor: const Color(0xFFFFFFFF)),
        ],
        onChange: _selectPage,
        style: const FluidNavBarStyle(
          iconUnselectedForegroundColor: Colors.black,
          barBackgroundColor: Color.fromARGB(255, 235, 235, 235),
        ),
      ),
    );
  }
}
