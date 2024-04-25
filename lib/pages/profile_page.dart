import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/pages/about_us.dart';
import 'package:ngo_connect/pages/personal_detail.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
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
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 100),

              //user profile image
              if (_user?.photoURL == null)
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/user.png'),
                )
              else
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(_user!.photoURL!),
              ),

              const SizedBox(
                height: 20,
              ),
              //user name
              Text(
                _user?.displayName ?? 'User Name',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              //my profile
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PersonalDetails();
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 151, 151, 151)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 151, 151, 151),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(8),
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 151, 151, 151)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.verified,
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    Text(
                      'My Certificates',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                    ),

                    Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AboutUs();
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 151, 151, 151)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.info,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                
                      Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 151, 151, 151),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  _auth.signOut();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 151, 151, 151)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 151, 151, 151),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
