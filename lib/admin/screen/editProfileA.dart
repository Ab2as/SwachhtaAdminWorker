import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachhta_app2/admin/screen/editProfileAdmin.dart';
import 'package:swachhta_app2/auth/login.dart';
import 'package:swachhta_app2/worker/utils/app_image_pick.dart';

class EditProfileA extends StatefulWidget {
  // const EditProfileW({super.key});
  EditProfileA({Key? key}) : super(key: key);
  @override
  State<EditProfileA> createState() => _EditProfileA();
}

class _EditProfileA extends State<EditProfileA> {
  FirebaseStorage storage = FirebaseStorage.instance;

  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? img) {
      setState(() {
        this.image = img;
      });
    });
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
              Stack(
                children: [
                  image != null
                      ? CircleAvatar(
                          radius: 65, backgroundImage: FileImage(image!))
                      : CircleAvatar(
                          radius: 65,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg'),
                        ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (image != null) {
                      String message;

                      try {
                        Reference ref = FirebaseStorage.instance
                            .ref()
                            .child("AdminProfileImage");
                        UploadTask uploadTask = ref.putFile(image!);

                        TaskSnapshot taskSnapshot =
                            await Future.value(uploadTask);
                        var newUrl = await taskSnapshot.ref.getDownloadURL();

                        print("Uploaded");
                        final collection = FirebaseFirestore.instance
                            .collection('AdminProfilePhoto');

                        await collection
                            .doc()
                            .set({'image': newUrl.toString()});

                        message = "Successful";
                        print("ahlf");
                      } catch (_) {
                        message = "Error";
                      }
                    }
                  },
                  child: Text("Update Image")),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(height: 20),
              itemProfile('Name', 'Pratik', CupertinoIcons.person),
              const SizedBox(
                height: 10.0,
              ),
              itemProfile('Gender', 'Male', Icons.male_rounded),
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
              itemProfile('Location', 'Russel Street', CupertinoIcons.location),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => EditProfileAdmin()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 75, 192, 108)),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 55),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 75, 192, 108)),
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
