import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              //app logo
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/people.png',
                  width: 150,
                  height: 150,
                  color: const  Color.fromARGB(255, 0, 171, 71),
                ),
              ),

              const SizedBox(height: 20),

              //app name
              const Text(
                'NGO-Connect',
                style:  TextStyle(
                  shadows: CupertinoContextMenu.kEndBoxShadow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              //app tagline
              const Text(
                'Empower . Connect . Impact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              const SizedBox(height: 20),

              //app description
              const Text(
                'NGO Connect connects you with local NGOs working on causes you care about. Donate easily, volunteer your time, and stay informed about their latest initiatives. \n\nTogether, let\'s make a difference!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}