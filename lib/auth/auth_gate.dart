
class NGOItem extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String contact;

  const NGOItem({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.contact,
  });

  //main stuff to look into - ngo picture in the cards
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      color: Color.fromRGBO(207, 249, 227, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                image,
                height: 140,
                width: double
                    .infinity, // Ensure image takes full width of the card
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 15.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 5),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 5),
                  Text(
                    contact,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
