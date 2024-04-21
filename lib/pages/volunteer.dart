import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/resource/ngo_volunteer.dart';

class Volunteer extends StatelessWidget {
  final ngoVolunteer volunteer;
  const Volunteer({super.key, required this.volunteer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                volunteer.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            //title
            Text(
              volunteer.title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 170, 57)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.email, size: 25),
                const SizedBox(width: 10),
                Text(
                  volunteer.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 8),
                const Icon(
                  Icons.phone,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  volunteer.phone,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 8),
                const Icon(
                  Icons.location_on,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  volunteer.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),

            //description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(volunteer.description),
            ),

            const SizedBox(height: 90),
            //button
            MyButton(buttonName: 'VOLUNTEER', onTap: () {})
          ],
        ),
      ),
    );
  }
}
