// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swachhta_app2/admin/screen/tab_screen_admin.dart';
import 'package:swachhta_app2/auth/forget_password.dart';
import 'package:swachhta_app2/auth/register.dart';
import 'package:swachhta_app2/controller/auth_controller.dart';
import 'package:swachhta_app2/worker/screen/tabs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  AuthController authController = Get.put(AuthController());

  // firebase
  // final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  // login(String email, String password) async {
  //   if (email == "" && password == "") {
  //     return UiHelper.CustomAlertBox(context, "Enter Required Fields");
  //   } else {
  //     UserCredential? usercredential;
  //     try {
  //       usercredential = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((value) => Navigator.of(context)
  //               .push(MaterialPageRoute(builder: (context) => TabsScreen())));
  //     } on FirebaseAuthException catch (ex) {
  //       return UiHelper.CustomAlertBox(context, ex.code.toString());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          // signIn(emailController.text, passwordController.text);
          if (_formKey.currentState!.validate()) {
            if (emailController.text == "abbas@gmail.com" &&
                passwordController.text == "abbas123") {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TabsScreenAdmin()));
            } else {
              // login(emailController.text, passwordController.text);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TabsScreen()));
              authController.loginUser(
                  emailController.text, passwordController.text);
            }
          }
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo/logo2.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen()));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Color.fromARGB(255, 65, 57, 57),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationScreen()));
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  // void signIn(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //                 Fluttertoast.showToast(msg: "Login Successful"),
  //                 Navigator.of(context).pushReplacement(
  //                     MaterialPageRoute(builder: (context) => HomeScreen())),
  //               });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";

  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }
}
