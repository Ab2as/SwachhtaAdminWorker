import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:swachhta_app2/auth/login.dart';
import 'package:swachhta_app2/controller/auth_controller.dart';
import 'package:swachhta_app2/profile/profile_menu_widget.dart';
import 'package:swachhta_app2/profile/update_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //padding: const EdgeInsets.all(tDefaultSize),
          padding: const EdgeInsets.all(10),

          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage("assets/images/Anurag.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Anurag Mishra",
                  style: Theme.of(context).textTheme.headlineMedium),
              //Text("Profile SubHeading", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UpdateProfileScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      //backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Edit Profile", //style: TextStyle(color: tDarkColor)
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU

              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // authController.signOut();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          }, //=>AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(
                          onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
