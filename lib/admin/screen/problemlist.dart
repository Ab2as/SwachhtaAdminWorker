import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/util/problem_data.dart';

class ProblemList extends StatefulWidget {
  const ProblemList({super.key});

  @override
  State<ProblemList> createState() => _ProblemListState();
}

List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];

bool _createdrop = false;

class _ProblemListState extends State<ProblemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Problems",
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
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: ProblemData(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: ProblemData(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: ProblemData(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: ProblemData(),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
    );
  }
}
