import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/firebase_options.dart';
import 'package:ngo_connect/pages/home.dart';
import 'package:ngo_connect/pages/login.dart';
import 'package:ngo_connect/pages/ngo_screen.dart';
import 'package:ngo_connect/pages/register_page.dart';
import 'package:ngo_connect/pages/welcome_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ngoConnect());
}

class ngoConnect extends StatelessWidget {
  const ngoConnect({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/login': (context) => const Login(),
    '/register': (context) => const Register(),
    '/home': (context) => const HomePage(),
    '/donate': (context) => const NGOScreen(),
    '/profile': (context) => const HomePage(),
  },
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}