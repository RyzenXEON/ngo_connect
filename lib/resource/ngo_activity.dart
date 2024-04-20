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
}

List<NGOActivity> ngoActivities = [
  NGOActivity(
    image: 'assets/images/ngo1.jpg',
    title: 'Donations Making a Difference',
    subHeading: 'Recent donations through NGO Connect helped',
    text: 'xyz',
  ),
  NGOActivity(
    image: 'assets/images/ngo2.jpg',
    title: 'Warm Winter are Here!',
    subHeading: 'Locals helping NGOs to provide warm clothes to the needy',
    text: 'xyz',
  ),
  NGOActivity(
    image: 'assets/images/ngo3.jpg',
    title: 'Children Education Drive',
    subHeading: 'Helping children to get education through monetary donations',
    text: 'xyz',
  ),
];
