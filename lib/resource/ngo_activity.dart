import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngo_connect/pages/ngo_page.dart';

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

// List<NGOActivity> ngoActivities = [
//   NGOActivity(
//     image: 'assets/images/ngo1.jpg',
//     title: 'Donations Making a Difference',
//     subHeading: 'Recent donations through NGO Connect are helping people with medical needs',
//     text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in convallis eros, ac vestibulum libero. Aliquam erat volutpat. Cras interdum turpis vel justo sagittis scelerisque. Nulla a enim magna. Integer non augue vitae nunc sollicitudin ullamcorper. Quisque volutpat velit in mi vulputate volutpat. Aenean auctor tincidunt turpis, vel varius ipsum. Vivamus ut tortor at lorem feugiat faucibus id nec erat. Cras iaculis lobortis mi. Phasellus maximus tincidunt dui, non rhoncus eros efficitur eget. Suspendisse potenti. Mauris pulvinar viverra feugiat. In hac habitasse platea dictumst. Aliquam ac magna eget mauris pellentesque viverra.',
//   ),
//   NGOActivity(
//     image: 'assets/images/ngo2.jpg',
//     title: 'Warm Winter are Here!',
//     subHeading: 'Locals helping NGOs to provide warm clothes to the needy',
//     text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in convallis eros, ac vestibulum libero. Aliquam erat volutpat. Cras interdum turpis vel justo sagittis scelerisque. Nulla a enim magna. Integer non augue vitae nunc sollicitudin ullamcorper. Quisque volutpat velit in mi vulputate volutpat. Aenean auctor tincidunt turpis, vel varius ipsum. Vivamus ut tortor at lorem feugiat faucibus id nec erat. Cras iaculis lobortis mi. Phasellus maximus tincidunt dui, non rhoncus eros efficitur eget. Suspendisse potenti. Mauris pulvinar viverra feugiat. In hac habitasse platea dictumst. Aliquam ac magna eget mauris pellentesque viverra.',
//   ),
//   NGOActivity(
//     image: 'assets/images/ngo3.jpg',
//     title: 'Children Education Drive',
//     subHeading: 'Helping children to get education through monetary donations',
//     text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in convallis eros, ac vestibulum libero. Aliquam erat volutpat. Cras interdum turpis vel justo sagittis scelerisque. Nulla a enim magna. Integer non augue vitae nunc sollicitudin ullamcorper. Quisque volutpat velit in mi vulputate volutpat. Aenean auctor tincidunt turpis, vel varius ipsum. Vivamus ut tortor at lorem feugiat faucibus id nec erat. Cras iaculis lobortis mi. Phasellus maximus tincidunt dui, non rhoncus eros efficitur eget. Suspendisse potenti. Mauris pulvinar viverra feugiat. In hac habitasse platea dictumst. Aliquam ac magna eget mauris pellentesque viverra.',
//   ),
// ];
