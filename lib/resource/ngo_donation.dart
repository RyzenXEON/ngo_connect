import 'package:cloud_firestore/cloud_firestore.dart';

class NGODonation {
  final String image;
  final String name;
  final String type;
  final String location;
  final String contact;

  NGODonation(
      {required this.image,
      required this.name,
      required this.type,
      required this.location,
      required this.contact});

  factory NGODonation.fromdocument(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return NGODonation(
      name: document.data()!['name'] as String,
      image: document.data()!['image'] as String,
      type: document.data()!['type'] as String,
      contact: document.data()!['contact'] as String,
      location: document.data()!['location'] as String,
    );
  }
}
