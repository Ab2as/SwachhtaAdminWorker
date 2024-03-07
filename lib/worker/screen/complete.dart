import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/utils/complete_data.dart';

class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Completed",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 128, 184, 183),
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
