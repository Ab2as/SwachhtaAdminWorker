import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/widget/completed_widget.dart';
import 'package:swachhta_app2/worker/widget/greeting_widget.dart';
import 'package:swachhta_app2/news/display_news.dart';

class HomeScreenWorker extends StatelessWidget {


  final int _index = 0;
  var name="Anurag";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('HomePage'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              GreetingWidget(name: "Anurag"),

              SizedBox(
                height: 200,
                child: NewsWidget(itemCount: 5,),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Completed"),
                    InkWell(
                      onTap: () {},
                      child: const Text("View All"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: PendingWidget(itemCount: 4,),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:const  EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pending"),
                    InkWell(
                      onTap: () {},
                      child: const Text("View All"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: PendingWidget(itemCount: 4,),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
