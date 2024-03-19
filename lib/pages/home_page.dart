

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: const Center(child: Text("Home        ")),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: _user !=null? _userInfo() : _googleSignInButton(),
    );
  }

  Widget _googleSignInButton(){
    return Center(
      child: ElevatedButton(
        onPressed: handleGoogleSignIn,
        
        child: const Text("Sign in with Google"),
      )
    );
  }

  Widget _userInfo(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(_user!.photoURL!),
              fit: BoxFit.fill,
            ),
          ),
        )],
      ),
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


