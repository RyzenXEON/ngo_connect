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
}


List <NGODonation> ngoDonations = [
  NGODonation(
    image: 'assets/images/donation1.jpg',
    name: 'Children Education Drive',
    type: 'Monitory',
    location: 'New Delhi, India',
    contact: '810-7685-910',
  ),
  NGODonation(
    image: 'assets/images/donation2.jpg',
    name: 'Sathi Foundation',
    type: 'Clothes',
    location: 'New Delhi, India',
    contact: '810-7685-910',
  ),
  NGODonation(
    image: 'assets/images/donation3.jpg',
    name: 'Jeevan Dhara',
    type: 'Food',
    location: 'New Delhi, India',
    contact: '810-7685-910',
  ),

  NGODonation(
    image: 'assets/images/donation4.jpg',
    name: 'Women Welfare Association',
    type: 'Monitory',
    location: 'New Delhi, India',
    contact: '810-7685-910',
  ),
];