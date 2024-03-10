import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swachhta_app2/controller/profile_controller.dart';
import 'package:swachhta_app2/worker/screen/tabs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _department = TextEditingController();
  String? selectedValue = null;

  final GlobalKey<FormState> formkey = GlobalKey();

  ProfileController profileController = Get.put(ProfileController());

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("MALE"), value: "MALE"),
      DropdownMenuItem(child: Text("FEMALE"), value: "FEMALE"),
    ];
    return menuItems;
  }

  @override
  void dispose() {
    _fullname.dispose();
    super.dispose();
  }

  @override
  void dispose1() {
    _address.dispose();
    super.dispose();
  }

  @override
  void dispose4() {
    _pincode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Center(
                    child: Text(
                  "Personal Details",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _fullname,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "Enter your full name",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter name";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                      ),
                      labelText: "Enter your Gender",
                      labelStyle:
                          TextStyle(color: Colors.white.withOpacity(0.9)),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                        // BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                        // BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                    ),
                    validator: (value) => value == null ? "Select a Sex" : null,
                    dropdownColor: Colors.white.withOpacity(0.3),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _address,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "Enter your address",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter address";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pincode,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "Enter your pincode",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[1-9][0-9]{5}$').hasMatch(value!)) {
                      return "Enter correct pincode";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _department,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                    ),
                    labelText: "Enter your Department",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      String message;
                      profileController.registerUser(
                        _fullname.text,
                        selectedValue.toString(),
                        _address.text,
                        _pincode.text,
                        _department.text,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TabsScreen(),
                      ));

                      // try {
                      //   final collection =
                      //       FirebaseFirestore.instance.collection('user');

                      //   await collection.doc().set({
                      //     'name': _fullname.text,
                      //     'mobileno': _mobileno.text,
                      //     'address': _address.text,
                      //     'pincode': _pincode.text,
                      //     'email': _email.text,
                      //   });
                      //   message = "Successful";
                      // } catch (_) {
                      //   message = "Error";
                      // }
                      // if (message == "Successful") {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => TabsScreen(),
                      //   ));
                      // } else {
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(SnackBar(content: Text(message)));
                      // }
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
