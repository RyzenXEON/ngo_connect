import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/resource/ngo_donation.dart';

class Donation extends StatelessWidget {
  final NGODonation donation;
  const Donation({super.key, required this.donation});

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
                donation.image,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              donation.name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 170, 57)),
            ),
            const SizedBox(height: 20),

            //Type of donation
            Row(
              children: [
                const SizedBox(width: 30),
                donation.type == 'Monitory'
                    ? const Icon(
                        Icons.monetization_on,
                        size: 25,
                      )
                    : donation.type == 'Food'
                        ? const Icon(
                            Icons.food_bank,
                            size: 30,
                          )
                        : const ImageIcon(
                            AssetImage('assets/images/shirt.png'),
                            size: 22,
                          ),
                const SizedBox(width: 10),
                Text(
                  donation.type,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),

            //phone number
            Row(
              children: [
                const SizedBox(width: 30),
                const Icon(
                  Icons.phone,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  donation.contact,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 20),

            //Location
            Row(
              
              children: [
                const SizedBox(width: 30),
                const Icon(
                  Icons.location_on,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  donation.location,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 90),
            MyButton(buttonName: 'DONATION', onTap: () {})
          ],
        ),
      ),
    );
  }
}
