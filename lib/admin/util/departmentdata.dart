import 'package:flutter/material.dart';
import 'package:swachhta_app2/worker/utils/details.dart';

class DepartmentData extends StatefulWidget {
  DepartmentData(
      {required this.createDrop,
      required this.dataName,
      required this.dataAge,
      required this.dataAddress,
      required this.dataGender,
      required this.title,
      super.key});

  bool createDrop;

  var title;

  var dataName;

  var dataAge;

  var dataAddress;

  var dataGender;

  @override
  State<DepartmentData> createState() => _DepartmentDataState();
}

class _DepartmentDataState extends State<DepartmentData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.createDrop = !widget.createDrop;
                              });
                            },
                            icon: Icon(widget.createDrop
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down))
                      ]),
                ),
              ),
            ),
            Visibility(
                visible: widget.createDrop,
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 217, 217),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Details(title: "Name: ", content: widget.dataName),
                        Details(title: "Age: ", content: widget.dataAge),
                        Details(title: "Gender: ", content: widget.dataGender),
                        Details(
                            title: "Address: ", content: widget.dataAddress),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
