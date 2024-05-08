import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UpdateProfileScreen();
  }
}

class _UpdateProfileScreen extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());

    String? userGender;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // -- IMAGE with ICON
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
                        borderRadius:
                            BorderRadius.circular(100), //color: tPrimaryColor
                      ),
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          label: Text("Name"),
                          prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    //const SizedBox(height: tFormHeight - 20),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                    ),
                    //const SizedBox(height: tFormHeight - 20),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("Phone No"),
                          prefixIcon: Icon(LineAwesomeIcons.phone)),
                    ),
                    //const SizedBox(height: tFormHeight - 20),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Address"),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    //const SizedBox(height: tFormHeight),
                    const SizedBox(height: 8),
                    // TextFormField(
                    //   obscureText: true,
                    //   decoration: const InputDecoration(
                    //     label: Text("Gender"),
                    //     prefixIcon: ,
                    //
                    //   ),
                    // ),

                    DropdownButtonFormField(
                        hint: const Text('Gender'),
                        icon: Icon(
                          userGender == 'Male'
                              ? Icons.male_rounded
                              : userGender == 'Female'
                                  ? Icons.female_rounded
                                  : Icons.transgender_sharp,
                        ),
                        value: userGender,
                        onChanged: (String? newValue) {
                          setState(() {
                            userGender = newValue!;
                          });
                        },
                        items: <String>['Male', 'Female', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),

                    const SizedBox(height: 10),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const UpdateProfileScreen()),
                        style: ElevatedButton.styleFrom(
                            //backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Update", //style: TextStyle(color: tDarkColor)
                        ),
                      ),
                    ),
                    //const SizedBox(height: tFormHeight),
                    const SizedBox(height: 10),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
