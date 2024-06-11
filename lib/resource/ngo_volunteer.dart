import 'package:cloud_firestore/cloud_firestore.dart';

class ngoVolunteer {
  final String image;
  final String title;
  final String description;
  final String email;
  final String phone;
  final String address;

  ngoVolunteer({
    required this.image,
    required this.title,
    required this.description,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory ngoVolunteer.fromdocument(DocumentSnapshot<Map<String, dynamic>> document) {
    return ngoVolunteer(
      title: document['title'] as String,
      image: document['image'] as String,
      description: document['description'] as String,
      email: document['email'] as String,
      phone: document['phone'] as String,
      address: document['address'] as String,
    );
  }
}

