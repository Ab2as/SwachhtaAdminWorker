import 'package:flutter/material.dart';
import 'package:swachhta_app2/data/department_model.dart';
import 'package:swachhta_app2/news/display_news.dart';
import 'package:swachhta_app2/worker/widget/greeting_widget.dart';

import '../data/dummy_data.dart';

class HomeScreenAdmin extends StatelessWidget {
  final int _index = 0;
  var name = "Admin";
  List<Department> availableDepartment = dept;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Column(
                children: [
                  GreetingWidget(name: name),

                  SizedBox(
                    height: 200,
                    child: NewsWidget(
                      itemCount: 5,
                    ),
                  ),

                  // GridView(
                  //   //padding: const EdgeInsets.all(24),
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //    // childAspectRatio: 3 / 2,
                  //     //crossAxisSpacing: 20,
                  //    // mainAxisSpacing: 20,
                  //   ),
                  //   children: [
                  //     for (final dept in availableDepartment)
                  //       DeptGridItem(
                  //         department: dept,
                  //         onSelectDept: () {},
                  //       )
                  //   ],
                  // ),
                ],
              ),
            )));
  }
}

/*
 */
