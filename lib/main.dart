import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngo_connect/auth/google_signin.dart';
import 'package:ngo_connect/firebase_options.dart';
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
    return  MaterialApp(
      initialRoute: '/',
      routes: {
        '/login': (context) => const GoogleSignIn(),
      },
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}