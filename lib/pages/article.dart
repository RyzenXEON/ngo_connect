import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/resource/ngo_activity.dart';

class Article extends StatelessWidget {
  final NGOActivity activity;
  const Article({super.key,required this.activity});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            //image
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                activity.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              activity.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 170, 57)
              ),
            ),
            const SizedBox(height: 20),
            Text(
              activity.subHeading,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              activity.text,
              style: const TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.w300,
              ),
            ),

          ],
        ),
      ),
    );
  }
}