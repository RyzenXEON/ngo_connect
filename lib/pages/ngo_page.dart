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
          ),
          Positioned(
            top: 75.0,
            left: 100.0,
            child: RichText(
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: "\nLet's make a change..."),
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
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 151, 151, 151), width: 2)),
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
            top: 250,
              child: ListView.builder(
                  itemCount: ngoActivities.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: const Color.fromRGBO(4, 224, 92, 1),
                      child: Column(
                        children: <Widget>[
                          Image.asset(ngoActivities[index].image),
                          ListTile(
                            title: Text(ngoActivities[index].title),
                            subtitle: Text(ngoActivities[index].subHeading),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

class NGOActivity {
  final String image;
  final String title;
  final String subHeading;
  final String text;

  NGOActivity(
      {required this.image,
      required this.title,
      required this.subHeading,
      required this.text});
}

List<NGOActivity> ngoActivities = [
  NGOActivity(
    image: 'assets/images/ngo1.jpg',
    title: 'Donations Making a Difference',
    subHeading: 'Recent donations through NGO Connect helped',
    text: 'xyz',
  ),
  NGOActivity(
    image: 'assets/images/ngo2.jpg',
    title: 'Warm Winter are Here!',
    subHeading: 'Locals helping NGOs to provide warm clothes to the needy',
    text: 'xyz',
  ),
  NGOActivity(
    image: 'assets/images/ngo3.jpg',
    title: 'Children Education Drive',
    subHeading: 'Helping children to get education through monetary donations',
    text: 'xyz',
  ),
];
