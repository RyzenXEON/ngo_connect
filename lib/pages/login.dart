import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/components/text_field.dart';
import 'package:ngo_connect/pages/home.dart';
import 'package:ngo_connect/pages/register_page.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _user == null
          ? Center(
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
                
                    //const SizedBox(height: 10),
                
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
                
                    //email text field
                    MyTextField(lable: 'Email', obscureText: false, controller: _emailController),
                
                    const SizedBox(height: 15),
                
                    //password text field
                    MyTextField(lable: 'Password', obscureText: true, controller: _pwController),
                
                    const SizedBox(height: 15),
                
                    //login button
                    MyButton(
                        buttonName: "LOGIN",
                        onTap: () {
                          try{
                          _auth.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _pwController.text);
                          }catch(e){
                            showDialog(
                              context: context,
                              builder: (context)=> AlertDialog(
                                title: Text(e.toString()),
                              ),
                            );
                          }
                        }),
                
                    const SizedBox(height: 15),
                
                    //new to ngo-connect? register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
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
                                    child: const Register(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade));
                          },
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Color.fromRGBO(4, 224, 92, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    const SizedBox(height: 15),
                    //google sign in
                    ElevatedButton(
                      onPressed: handleGoogleSignIn,
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shape: CircleBorder(),
                
                      ),
                      child: Image.asset('assets/images/google.png', scale: 35,),
                    )
                  ],
                ),
              ),
            )
          : const HomePage(),
    );
  }

  void handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleProvider);
      await _auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }
}
