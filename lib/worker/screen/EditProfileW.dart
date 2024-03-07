import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileW extends StatefulWidget {
  // const EditProfileW({super.key});
  EditProfileW({Key? key}) : super(key: key);
  @override
  State<EditProfileW> createState() => _EditProfileW();
}

class _EditProfileW extends State<EditProfileW> {
  bool is_subtitle_name = true,
      is_subtitle_address = true,
      is_subtitle_designation = true,
      is_subtitle_organization = true;

  String name = 'Pratik',
      address = 'Russel Street',
      gender = 'Male',
      designation = 'Employee',
      organization = 'Bengal Municipal Co.';

  IconData iconData = Icons.male_rounded;

  late TextEditingController myController;
  @override
  void initState() {
    super.initState();

    myController = TextEditingController();
  }

  @override
  void dispose() {
    myController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const CircleAvatar(
                  radius: 65,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg')),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ))),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.deepOrange.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Name'),
                  // subtitle: Text(name),
                  leading: Icon(CupertinoIcons.person),
                  trailing: TextButton(
                    onPressed: () async {
                      final name = await openName();
                      if (name != null) {
                        setState(() => this.name = name);
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(name),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              itemProfile('Email', 'ps@gmail.com', CupertinoIcons.mail),
              const SizedBox(
                height: 10.0,
              ),
              itemProfile('Mobile Number', '9873214560', CupertinoIcons.phone),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.deepOrange.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Location'),
                  // subtitle: Text(name),
                  leading: Icon(CupertinoIcons.location),
                  trailing: TextButton(
                    onPressed: () async {
                      final address = await openAddress();
                      if (address != null) {
                        setState(() => this.address = address);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(address),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.deepOrange.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Gender'),
                  trailing: TextButton(
                    onPressed: () async {
                      final gender = await openGender();
                      if (gender != null) {
                        setState(() => this.gender = gender);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ),
                  leading: Icon(gender == 'Male'
                      ? Icons.male_rounded
                      : Icons.female_rounded),
                  subtitle: Text(gender),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.deepOrange.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Designation'),
                  // subtitle: Text(name),
                  leading: Icon(CupertinoIcons.desktopcomputer),
                  trailing: TextButton(
                    onPressed: () async {
                      final designation = await openDesignation();
                      if (designation != null) {
                        setState(() => this.designation = designation);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(designation),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.deepOrange.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10)
                    ]),
                child: ListTile(
                  title: const Text('Organization'),
                  // subtitle: Text(name),
                  leading: Icon(CupertinoIcons.building_2_fill),
                  trailing: TextButton(
                    onPressed: () async {
                      final organization = await openOrganization();
                      if (organization != null) {
                        setState(() => this.organization = organization);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(organization),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 167, 128, 143)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openName() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Name"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter Your Name"),
              controller: myController,
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  Future<String?> openAddress() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Address"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter Your Address"),
              controller: myController,
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  Future<String?> openGender() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Gender"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter Your Gender"),
              controller: myController,
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  Future<String?> openDesignation() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Designation"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter Your Designation"),
              controller: myController,
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  Future<String?> openOrganization() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Organization"),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Enter Your Organization"),
              controller: myController,
            ),
            actions: [TextButton(onPressed: submit, child: Text('Submit'))],
          ));

  void submit() {
    Navigator.of(context).pop(myController.text);
    myController.clear();
  }
}

itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.deepOrange.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      tileColor: Colors.white,
    ),
  );
}
