import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    // TODO: implement initState
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70.0,
            left: 30.0,
            child: ClipOval(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                child: Image(
                  image: NetworkImage(_user!.photoURL!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 75.0,
            left: 100.0,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Hi user!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "\nLet's start donating..."),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 140.0,
            left: 30.0,
            right: 30.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color:  Color.fromARGB(255, 151, 151, 151), width: 2)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(4, 224, 92, 1), width: 2),
                  ),
                  hintText: "Search for NGO's...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            top: 220.0,
            left: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 60.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/ngo3.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
