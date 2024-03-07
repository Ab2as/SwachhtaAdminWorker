import 'package:flutter/material.dart';
import 'package:swachhta_app2/news/display_news.dart';
import 'package:swachhta_app2/worker/screen/complete.dart';
import 'package:swachhta_app2/worker/screen/pending.dart';
import 'package:swachhta_app2/worker/widget/completed_widget.dart';
import 'package:swachhta_app2/worker/widget/greeting_widget.dart';

import '../worker/widget/pending_widget.dart';
import 'main_drawer.dart';

class HomeScreenWorker extends StatelessWidget {
  final int _index = 0;
  var name = "Anurag";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title:const Text('Swachhta'),
        // ),
        drawer: const MainDrawer(userId: ""),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 65),
              child: Column(
                children: [
                  GreetingWidget(name: "Anurag"),
                  SizedBox(
                    height: 220,
                    child: NewsWidget(
                      itemCount: 5,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CompleteScreen()));
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 220,
                    child: CompleteWidget(
                      itemCount: 4,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pending",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PendingScreen()));
                          },
                          child: const Text(
                            "View All",
                            style: TextStyle(
                              fontSize: 18,

                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 220,
                    child: PendingWidget(itemCount: 4),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )));
  }
}
