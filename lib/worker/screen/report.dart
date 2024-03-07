import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/utils/complete_data.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

List number = [
  'Clean',
  'Animal',
  'Water',
  'Dust',
  'Sewage',
];

bool _progressColor = true;

// Color myColor = _progressColor ? Colors.red : Colors.blue;

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Report",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 55, 86, 106),
            Color.fromARGB(255, 86, 107, 136)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CompleteData(index: index);
          },
          itemCount: number.length,
        ),
      ),
    );
  }
}
