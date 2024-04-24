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

// List<NGODonation> ngoDonations = [
//   NGODonation(
//     image: 'assets/images/donation1.jpg',
//     name: 'Children Education Drive',
//     type: 'Monitory',
//     location: 'Safdarjung, New Delhi - India',
//     contact: '810-7685-910',
//   ),
//   NGODonation(
//     image: 'assets/images/donation2.jpg',
//     name: 'Sathi Foundation',
//     type: 'Clothes',
//     location: 'Indira Nagar, Ghaziabad - UP',
//     contact: '810-7685-910',
//   ),
//   NGODonation(
//     image: 'assets/images/donation3.jpg',
//     name: 'Jeevan Dhara',
//     type: 'Food',
//     location: 'Electronic City, Noida - UP',
//     contact: '810-7685-910',
//   ),
//   NGODonation(
//     image: 'assets/images/donation4.jpg',
//     name: 'Women Welfare Association',
//     type: 'Monitory',
//     location: 'Chandni Chowk, New Delhi - India',
//     contact: '810-7685-910',
//   ),
// ];
