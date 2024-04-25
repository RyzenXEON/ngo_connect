import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
          
              //user profile image
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
          
              SizedBox(height: 20),
          
              //user name
              Text(
                  _auth.currentUser?.displayName ?? 'User Name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
              const SizedBox(height: 30),
          
              //user email
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 210, 77),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20,),
                      const Text(
                        'Email :',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        _auth.currentUser?.email ?? 'User Email',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //phonenumber
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 0, 210, 77),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                       Text(
                        'Phone :',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text( '+917408454902',
                        style:  TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //edit button
              ElevatedButton(
                style:  ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 210, 77)),
                ),
                onPressed: () {
                  
                },
                child: const Text('EDIT', style: TextStyle(fontSize: 20,color: Colors.black),),
              ),
            ],

            
          ),
        ),
      ),
    );
  }
}
