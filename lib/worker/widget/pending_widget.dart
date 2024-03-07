import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/screen/submit.dart';

class PendingWidget extends StatefulWidget {
  PendingWidget({super.key, required this.itemCount});

  var itemCount;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PendingWidget();
  }
}

class _PendingWidget extends State<PendingWidget> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: widget.itemCount,
      controller: PageController(viewportFraction: 0.8),
      onPageChanged: (index) => setState(() => _index = index),
      itemBuilder: (context, index) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          padding: EdgeInsets.all(_index == index ? 0.0 : 8.0),
          child: Card(
            elevation: 4,
            color: Colors.white10,
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 157, 181, 222),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Overflow of Sewage or Storm Water reported",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SubmitScreen()));
                              },
                              child: const Text(
                                "View Status",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 38, 73, 133)),
                              ))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "ID: 123456",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            "Kanpur",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
