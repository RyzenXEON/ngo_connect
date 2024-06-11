import 'package:cloud_firestore/cloud_firestore.dart';

class NGOActivity {
  final String image;
  final String title;
  final String subHeading;
  final String text;

  NGOActivity(
      {required this.image,
      required this.title,
      required this.subHeading,
      required this.text}
  );

  factory NGOActivity.fromdocument(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return NGOActivity(
      title: document.data()!['title'] as String,
      image: document.data()!['image'] as String,
      subHeading: document.data()!['subHeading'] as String,
      text: document.data()!['text'] as String,
    );
  }
}
