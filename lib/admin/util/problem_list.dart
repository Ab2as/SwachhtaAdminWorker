import 'package:flutter/material.dart';
import 'package:swachhta_app2/admin/screen/problemlist.dart';

class Problem_List extends StatelessWidget {
  Problem_List({required this.image, required this.title, super.key});

  var image;

  var title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 8, 12, 63),
          image: DecorationImage(
            image: AssetImage(image),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.6),
              BlendMode.modulate,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 240, 240, 239),
                    fontFamily: 'SignikaNegative',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProblemList()));
      },
    );
  }
}
