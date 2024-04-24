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

// List<ngoVolunteer> ngoVolunteers = [
//   ngoVolunteer(
//     image: 'assets/images/volunteer1.jpg',
//     title: 'Plantation Drive Volunteer',
//     description:'Help us plant around the city, with over 100+ plople joining us this weekend',
//     email: 'volunteer@sathi.in',
//     phone: '810-7685-910',
//     address: 'Indira Nagar, Ghaziabad - UP',
//   ),
//   ngoVolunteer(
//     image: 'assets/images/volunteer2.jpg',
//     title: 'Day Care Volunteer',
//     description:'Looking for volunteers to help in day care for children age between 3-5 years',
//     email: 'daycare.volunteer@edudrive.in',
//     phone: '810-7685-910',
//     address: 'Safdarjung, New Delhi - India',
//   ),
// ];
