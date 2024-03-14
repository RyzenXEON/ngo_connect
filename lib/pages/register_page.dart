import 'package:flutter/material.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/components/text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  void onTap() {}
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
              const MyTextField(lable: 'Name', obscureText: false),

              const SizedBox(height: 15),
          
              //email text field
              const MyTextField(lable: 'Email', obscureText: false),
          
              const SizedBox(height: 15),
          
              //password text field
              const MyTextField(lable: 'Password', obscureText: true),
          
              const SizedBox(height: 15),
          
              //confirm password text field
              const MyTextField(lable: 'Confirm', obscureText: true),
          
              const SizedBox(height: 15),
          
              //phone text field
              const MyTextField(lable: 'Phone', obscureText: false),
          
              const SizedBox(height: 15),
          
              //login button
              MyButton(buttonName: "REGISTER", onTap: onTap),
          
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
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/login');
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