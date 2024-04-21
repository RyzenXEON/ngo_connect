import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo_connect/pages/donation.dart';
import 'package:ngo_connect/resource/ngo_donation.dart';

class NGOScreen extends StatelessWidget {
  const NGOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            //search bar
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 151, 151, 151), width: 2)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(4, 224, 92, 1), width: 2),
                ),
                hintText: "Search for Donating...",
                border: InputBorder.none,
              ),
            ),


            //donation list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ngoDonations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Donation(donation: ngoDonations[index],
                      ),
                    ),),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10,
                      color: const Color.fromARGB(255, 110, 253, 129),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                ngoDonations[index].image,
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              ngoDonations[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                ngoDonations[index].type == 'Monitory'
                                    ? const Icon(
                                        Icons.monetization_on,
                                        size: 25,
                                      )
                                    : ngoDonations[index].type == 'Food'
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
                                  ngoDonations[index].type,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                                
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.phone,
                                  size: 25,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  ngoDonations[index].contact,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.location_on,
                                  size: 25,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  ngoDonations[index].location,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
