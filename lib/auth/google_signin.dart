import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/pages/home.dart';
import 'package:ngo_connect/pages/login.dart';

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({super.key});

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
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
      body: _user !=null? const HomePage() : const Login(),
    );
  }
  void handleGoogleSignIn() async{
    try{
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleProvider);
      await _auth.signInAnonymously();
    } catch(e){
      print(e);
    }
  }
}