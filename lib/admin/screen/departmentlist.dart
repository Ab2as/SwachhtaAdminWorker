import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/util/departmentdata.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];

bool _createdrop = false;

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Departments",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 196, 226, 226),
              Color.fromARGB(255, 44, 58, 77)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DepartmentData(
                    createDrop: false,
                    dataName: "Abbas",
                    dataAge: "22",
                    dataAddress: "Kanpur",
                    dataGender: "Male",
                    title: "Cleanliness"),
                DepartmentData(
                    createDrop: false,
                    dataName: "Aniket",
                    dataAge: "22",
                    dataAddress: "Kanpur",
                    dataGender: "Male",
                    title: "Sewage"),
                DepartmentData(
                    createDrop: false,
                    dataName: "Anurag",
                    dataAge: "22",
                    dataAddress: "Kanpur",
                    dataGender: "Male",
                    title: "Water"),
              ],
            ),
          )),
    );
  }
}
