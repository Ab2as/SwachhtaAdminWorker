import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/utils/pending_data.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];

bool _progressColor = true;

// Color myColor = _progressColor ? Colors.red : Colors.blue;

class _PendingScreenState extends State<PendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pending",
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
          itemBuilder: (context, index) => Dismissible(
              direction: DismissDirection.startToEnd,
              resizeDuration: const Duration(milliseconds: 200),
              key: ValueKey("value"),
              background: Container(
                padding: const EdgeInsets.only(left: 28.0),
                alignment: AlignmentDirectional.centerStart,
                color: const Color.fromARGB(255, 216, 138, 132),
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
              child: PendingData(index: index)),
          itemCount: number.length,
        ),
      ),
    );
  }
}
