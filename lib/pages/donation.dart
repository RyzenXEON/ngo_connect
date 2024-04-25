
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ngo_connect/components/button.dart';
import 'package:ngo_connect/pages/monitory_donation.dart';
import 'package:ngo_connect/resource/ngo_donation.dart';

class Donation extends StatefulWidget {
  final NGODonation donation;
  Donation({super.key, required this.donation});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  TextEditingController amountController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //add food donation to the database
  Future<void> addDonationDetails(
      String donationName, Position position, String type) async {
    // Get the current user's UID
    final String uid = _auth.currentUser!.uid;
    final String name =
        _auth.currentUser!.displayName ?? ""; // Get user's name (if available)
    final String phoneNumber = _auth.currentUser!.phoneNumber!;

    // Prepare donation data
    final donationData = {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'title': donationName,
    };

    if (type == 'Food') {
      await _db.collection('foodDonation').add(donationData);
    } else {
      await _db.collection('clothesDonation').add(donationData);
    }
  }

  //location permission
  Future <Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      
      await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    print(
        "Latitude : ${position.latitude.toString()}; Longitude : ${position.longitude.toString()}");
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
          
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  widget.donation.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.donation.name,
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
                  widget.donation.type == 'Monitory'
                      ? const Icon(
                          Icons.monetization_on,
                          size: 25,
                        )
                      : widget.donation.type == 'Food'
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
                    widget.donation.type,
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
                    widget.donation.contact,
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
                    widget.donation.location,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
          
              //Amount
              if (widget.donation.type == 'Monitory')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.currency_rupee),
                      labelText: 'Amount',
                      labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 0, 170, 57),
                          fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 170, 57),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
          
              const SizedBox(height: 30),
              MyButton(
                  buttonName: 'DONATION',
                  onTap: () async {
                    if (widget.donation.type == 'Monitory') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MonitoryDonation(
                                  amount: double.parse(amountController.text))));
                    } else {
                      final position = await getCurrentLocation();
          
                      //adding Location and PhoneNumber to the database if not already present
                      addDonationDetails(widget.donation.name,
                          position as Position, widget.donation.type);
          
                      //Notification of successful donation details submitted
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Donation Details Submitted Successfully, you will be called shortly for further details.',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 170, 57)),
                          ),
                          duration: Duration(seconds: 10),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
