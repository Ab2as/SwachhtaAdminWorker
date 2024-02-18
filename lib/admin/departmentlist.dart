import 'package:flutter/material.dart';

class DepartmentList extends StatefulWidget {
  const DepartmentList({super.key});

  @override
  State<DepartmentList> createState() => _DepartmentListState();
}

List number = ['Clean', 'Animal', 'Water', 'Dust', 'Sewage'];
bool _createdrop = false;

class _DepartmentListState extends State<DepartmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Departments",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        // children: [
        child: ListView.builder(
          itemCount: number.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Container(
              //   height: 70,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     color: const Color.fromARGB(255, 216, 191, 116),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Namaz",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _createdrop = !_createdrop;
                                      });
                                    },
                                    icon: Icon(_createdrop
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down))
                              ]),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _createdrop,
                        child: Container(
                            height: 100, width: 300, child: Text("data"))

                        // Container(
                        //   height: 180,
                        //   width: 300,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5),
                        //     color: const Color.fromARGB(255, 8, 12, 63),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       const SizedBox(
                        //         height: 5,
                        //       ),
                        //       InkWell(
                        //         child: Container(
                        //           height: 30,
                        //           width: 300,
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(5),
                        //             color: const Color.fromARGB(255, 39, 73, 166),
                        //           ),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: const [
                        //               Text(
                        //                 'Fajr',
                        //                 style: TextStyle(
                        //                     fontSize: 20,
                        //                     fontWeight: FontWeight.bold),
                        //                 textAlign: TextAlign.center,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         onTap: () {},
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ),

                    //     ListTile(
                    //         leading: const CircleAvatar(
                    //           backgroundColor: Color.fromARGB(255, 22, 175, 231),
                    //           child: Text("1"),
                    //         ),
                    //         title: Text(number[index]),
                    //         subtitle: const Text("data"),
                    //         trailing: IconButton(
                    //             onPressed: () {
                    //               setState(() {
                    //                 _createdrop = !_createdrop;
                    //               });
                    //             },
                    //             icon: Icon(_createdrop
                    //                 ? Icons.arrow_drop_down_circle
                    //                 : Icons.arrow_drop_down))),
                    //     Visibility(
                    //         visible: _createdrop,
                    //         child: Container(
                    //             height: 300, width: 300, child: Text("data")))
                  ],
                ),
              ),
              // ),
            );
          },
        ),

        // ],
      ),
    );
  }
}
