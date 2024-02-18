import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/submit.dart';

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
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SubmitScreen()));
              },
              child: Container(
                height: 80,
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 202, 216, 219),
                    color: _progressColor
                        ? Color.fromARGB(255, 200, 152, 150)
                        : Color.fromARGB(255, 202, 216, 219),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 174, 169, 169),
                          spreadRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage('assets/images/flower.jpg'),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Name : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  number[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Subject : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  number[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Date : ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  number[index],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: number.length,
        ),
      ),
    );
  }
}
