import 'package:flutter/material.dart';


class CompleteData extends StatelessWidget {

  CompleteData({required this.index, super.key});


  List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];


  var index;


  @override

  Widget build(BuildContext context) {

    return Container(

      height: 80,

      width: double.infinity,

      margin: const EdgeInsets.all(10),

      decoration: BoxDecoration(

          color: const Color.fromARGB(255, 202, 216, 219),

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

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                      Text(

                        number[index],

                        style: const TextStyle(

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                    ],

                  ),

                  Row(

                    children: [

                      const Text(

                        "Subject : ",

                        style: TextStyle(

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                      Text(

                        number[index],

                        style: const TextStyle(

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                    ],

                  ),

                  Row(

                    children: [

                      const Text(

                        "Date : ",

                        style: TextStyle(

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                      Text(

                        number[index],

                        style: const TextStyle(

                            fontSize: 15, fontWeight: FontWeight.bold),

                      ),

                    ],

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}

