import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/screen/departmentlist.dart';
import 'package:swachhta_app2/admin/util/dept_grid_item.dart';
import 'package:swachhta_app2/data/department_model.dart';
import 'package:swachhta_app2/data/dummy_data.dart';
import 'package:swachhta_app2/news/display_news.dart';
import 'package:swachhta_app2/worker/widget/greeting_widget.dart';

class HomeScreenAdmin extends StatelessWidget {
  final int _index = 0;
  var name = "Admin";
  List<Department> availableDepartment = dept;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 65),
      child: Column(
        children: [
          GreetingWidget(name: name),
          SizedBox(
            height: 220,
            child: NewsWidget(
              itemCount: 5,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: [
                for (final dept in availableDepartment)
                  DeptGridItem(
                    department: dept,
                    onSelectDept: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DepartmentList()));
                    },
                  )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

/*
 */
