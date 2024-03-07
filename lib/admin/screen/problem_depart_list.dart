import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/util/problem_list.dart';

class ProblemDepartScreen extends StatelessWidget {
  const ProblemDepartScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose Department",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(255, 33, 202, 165),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                GridView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  children: [
                    Problem_List(
                        image: '',
                        title: "Yellow Spot \n(Public Urination Spot)"),
                    Problem_List(
                        image: '',
                        title: "Debris Removal/Construction Material"),
                    Problem_List(
                        image: '', title: "Burning of Garbage in Open Space"),
                    Problem_List(
                        image: '',
                        title: "Improper Disposal of Fecal Waste/Septage"),
                    Problem_List(
                        image: '', title: "Stagnant Water On The Road"),
                    Problem_List(image: '', title: "No water supply"),
                    Problem_List(image: '', title: "Electricity Problem"),
                    Problem_List(image: '', title: "Sweeping not done"),
                    Problem_List(image: '', title: "Open Manholes Or Drains"),
                    Problem_List(image: '', title: "Dustbins Not Cleaned"),
                    Problem_List(image: '', title: "Dead Animal(s)"),
                    Problem_List(
                        image: '',
                        title: "Overflow of Sewerage or Storm Water"),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
