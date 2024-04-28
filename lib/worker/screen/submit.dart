import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachhta_app2/worker/utils/app_image_pick.dart';
import 'package:swachhta_app2/worker/utils/details.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  FirebaseStorage storage = FirebaseStorage.instance;

  File? image;

  pickImage(ImageSource source) {
    AppImagePicker(source: source).pick(onPick: (File? image) {
      setState(() {
        this.image = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Submit",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 14, 47, 68), Colors.black],
                begin: Alignment.bottomRight,
                end: Alignment.centerRight)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 55, 65, 140),
                    Color.fromARGB(255, 226, 212, 212),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Details(title: "Name: ", content: "Abbas"),
                      Details(title: "Subject: ", content: "Clean"),
                      Details(title: "Date: ", content: "12/12/2024"),
                      Details(title: "Description: ", content: "Cleanliness"),
                      Details(title: "Address: ", content: "Kanpur"),
                    ],
                  ),
                ),
              ),
            ),
            image != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      width: 400,
                      decoration: BoxDecoration(border: Border.all(width: 1.5)),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Text("No Image Selected"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                String message;

                try {
                  Reference ref =
                      FirebaseStorage.instance.ref().child("SubmitImage");
                  UploadTask uploadTask = ref.putFile(image!);

                  TaskSnapshot taskSnapshot = await Future.value(uploadTask);
                  var newUrl = await taskSnapshot.ref.getDownloadURL();

                  print("Uploaded");
                  final collection =
                      FirebaseFirestore.instance.collection('submitImage');

                  await collection.doc().set({'image': newUrl.toString()});
                  message = "Successful";
                  print("ahlf");
                } catch (_) {
                  message = "Error";
                }
                if (message == "Successful") {
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage(ImageSource.camera);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
