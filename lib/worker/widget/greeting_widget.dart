import 'package:flutter/material.dart';

class GreetingWidget extends StatefulWidget {
  GreetingWidget({super.key, required this.name});
  var name;
  @override
  State<GreetingWidget> createState() {
    return _GreetingWidget();
  }
}

class _GreetingWidget extends State<GreetingWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
        color: Colors.black,

        style: BorderStyle.solid,
      ),
      ),
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(text: TextSpan(text: "Welcome!, " ,style:const TextStyle(
                  color: Colors.black,
                  fontSize: 17
                ) , children: [
                  TextSpan(text:  widget.name , style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ))
                ] ),

                   ),
                const Text("Here are today's actions for you"),
              ]),
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/images/Anurag.jpg"),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
