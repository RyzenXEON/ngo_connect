import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/auth/google_signin.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/components/text_field.dart';
import 'package:ngo_connect/pages/home.dart';
import 'package:ngo_connect/pages/verify_otp.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  User? _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //icon of the app
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.black,
              ),

              const SizedBox(height: 25),

              //welcome
              const Text(
                "NGO - CONNECT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //const SizedBox(height: 25),

              //login to your account
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 40),

              //name text field
              MyTextField(
                  lable: 'Name',
                  obscureText: false,
                  controller: _nameController),

              const SizedBox(height: 15),

              //email text field
              MyTextField(
                lable: 'Email',
                obscureText: false,
                controller: _emailController,
              ),

              const SizedBox(height: 15),

              //password text field
              MyTextField(
                  lable: 'Password',
                  obscureText: true,
                  controller: _pwController),

              const SizedBox(height: 15),

              //confirm password text field
              MyTextField(
                  lable: 'Confirm',
                  obscureText: true,
                  controller: _confirmController),

              const SizedBox(height: 15),

              //phone text field
              MyTextField(
                  lable: 'Phone',
                  obscureText: false,
                  controller: _phoneController),

              const SizedBox(height: 15),

              //login button
              MyButton(
                  buttonName: "REGISTER",
                  onTap: () async {
                    await _auth.verifyPhoneNumber(
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (verificationId, resendToken) {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: VerifyOTP(
                                  verificationId: verificationId,
                                  displayName: _nameController.text,
                                  email: _emailController.text,
                                  password: _pwController.text,
                                ),
                                childCurrent: super.widget,
                                type: PageTransitionType.leftToRightWithFade));
                      },
                      codeAutoRetrievalTimeout: (verificationId) {},
                      phoneNumber: _phoneController.text,
                      timeout: const Duration(seconds: 120),
                    );
                  }),

              const SizedBox(height: 15),

              //new to ngo-connect? register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const GoogleSignIn(),
                              childCurrent: super.widget,
                              type: PageTransitionType.leftToRightWithFade));
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Color.fromRGBO(4, 224, 92, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
