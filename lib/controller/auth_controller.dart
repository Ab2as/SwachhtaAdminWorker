import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swachhta_app2/model/user_model.dart' as model;
import 'package:swachhta_app2/widget/constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage;

  late Rx<User?> _user; //when is logged in and redirect to home page

  File? get ProfilePhoto => _pickedImage.value;

  User get user => _user.value!;

  // @override
  // void onReady() {
  //   super.onReady();

  //   _user = Rx<User?>(firebaseAuth.currentUser);

  //   _user.bindStream(firebaseAuth.authStateChanges());

  //   ever(_user, _setInitialScreen);
  // }

  // _setInitialScreen(User? user) {
  //   if (user == null) {
  //     Get.offAll(() => LoginScreen());
  //   } else {
  //     Get.offAll(() => const TabsScreen());
  //   }
  // }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have sucessfully selected your profile picture');
    }

    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  //upload to firestore storage

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebsaeStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);

    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  //register the user

  // void registerUser(
  //     String username, String email, String password, File? image) async {
  //   try {
  //     if (username.isNotEmpty &&
  //         email.isNotEmpty &&
  //         password.isNotEmpty &&
  //         image != null) {
  //       //save user to our auth and firebase firestore

  //       UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
  //           email: email, password: password);

  //       String downloadUrl = await _uploadToStorage(image);

  //       model.User user = model.User(
  //           name: username,
  //           email: email,
  //           profilePhoto: downloadUrl,
  //           uid: cred.user!.uid);

  //       await firestore
  //           .collection('users')
  //           .doc(cred.user!.uid)
  //           .set(user.toJson());
  //     } else {
  //       Get.snackbar(
  //         "Error Creating Account",
  //         'Please enter all the fields',
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       "Error Creating Account",
  //       e.toString(),
  //     );
  //   }
  // }

  void registerUser(String username, String email, String password) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        //save user to our auth and firebase firestore

        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        // String downloadUrl = await _uploadToStorage(image);

        model.User user =
            model.User(name: username, email: email, uid: cred.user!.uid);

        await firestore
            .collection('worker')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        print("Log Success");
      } else {
        Get.snackbar(
          "Error Logging in",
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error Creating Account",
        e.toString(),
      );
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }

  resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar("Email Sent", "Password Reset Email has been sent");
    } catch (e) {
      Get.snackbar("User Not Found", "No user fount for that email");
    }
  }
}
