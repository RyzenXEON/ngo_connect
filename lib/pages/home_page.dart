import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/pages/article.dart';
import 'package:ngo_connect/resource/ngo_activity.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<NGOActivity>> ngoActivities = Future.value([]);
  User? _user;
  @override
  void initState() {
    _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
    super.initState();
    ngoActivities = getActivities();
  }

  Future<List<NGOActivity>> getActivities() async {
    final snapshot = await _db.collection('activities').get();
    final activities =
        snapshot.docs.map((doc) => NGOActivity.fromdocument(doc)).toList();
    return activities;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.transparent,
                      child: (_user?.photoURL == null)
                          ? const Image(
                              image: AssetImage('assets/images/user.png'),
                              fit: BoxFit.cover,
                            )
                          : Image(
                              image: NetworkImage(_user!.photoURL!),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: (_user?.displayName != null)
                              ? _user?.displayName
                              : 'User Name',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "\nLet's make a change..."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151), width: 2)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(4, 224, 92, 1), width: 2),
                ),
                hintText: "Search for NGOs...",
                border: InputBorder.none,
              ),
            ),

            //ngo lists

            Expanded(
              child: FutureBuilder(
                future: getActivities(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 0, 170, 57),
                    ));
                  } else {
                    final ngoActivities = snapshot.data as List<NGOActivity>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: ngoActivities.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Article(
                                activity: ngoActivities[index],
                              ),
                            ),
                          ),
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            elevation: 10,
                            color: const Color.fromARGB(255, 110, 253, 129),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      ngoActivities[index].image,
                                      width: double.infinity,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    ngoActivities[index].title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(ngoActivities[index].subHeading),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
