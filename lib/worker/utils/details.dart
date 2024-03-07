import 'package:flutter/material.dart';


class Details extends StatelessWidget {

  Details({required this.title, required this.content, super.key});


  var title;


  var content;


  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,

      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

          ),

          Text(

            content,

            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),

          ),

        ],

      ),

    );

  }

}

