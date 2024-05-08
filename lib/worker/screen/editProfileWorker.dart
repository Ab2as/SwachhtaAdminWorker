import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileWorker extends StatefulWidget {
  EditProfileWorker({Key? key}) : super(key: key);
  @override
  State<EditProfileWorker> createState() => _EditProfileWorker();
}

class _EditProfileWorker extends State<EditProfileWorker> {
  String name = 'Pratik', address = 'Russel Street', gender = 'Male';

  late TextEditingController nameController,
      addressController,
      genderController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    addressController = TextEditingController(text: address);
    genderController = TextEditingController(text: gender);
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    genderController.dispose();
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
              itemProfile('Name', nameController, CupertinoIcons.person),
              const SizedBox(height: 10.0),
              ItemProfile('Email', 'ps@gmail.com', CupertinoIcons.mail),
              const SizedBox(height: 10.0),
              ItemProfile('Mobile Number', '9873214560', CupertinoIcons.phone),
              const SizedBox(height: 10.0),
              itemProfile(
                  'Location', addressController, CupertinoIcons.location),
              const SizedBox(height: 10.0),
              itemProfile(
                  'Gender', genderController, CupertinoIcons.mail), //Edit icon
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => EditProfileWorker()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 167, 128, 143)),
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(
      String title, TextEditingController controller, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 21, 84, 35).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: 'Enter $title'),
        ),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

ItemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Color.fromARGB(255, 21, 84, 35).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(title == 'Gender'
          ? subtitle == 'Male'
              ? Icons.male_rounded
              : Icons.female_rounded
          : iconData),
      tileColor: Colors.white,
    ),
  );
}
