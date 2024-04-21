import 'package:flutter/material.dart';
import 'package:ngo_connect/resource/ngo_volunteer.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

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
                hintText: "Search for Volunteering...",
                border: InputBorder.none,
              ),
            ),

            const SizedBox(height: 10),

            //donation list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ngoVolunteers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 10,
                    color: Color.fromARGB(255, 110, 253, 129),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              ngoVolunteers[index].image,
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ngoVolunteers[index].title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              const Icon(Icons.email, size: 25),
                              const SizedBox(width: 10),
                              Text(
                                ngoVolunteers[index].email,
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
                                Icons.phone,
                                size: 25,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                ngoVolunteers[index].phone,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              const SizedBox(width: 10),
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
                                ngoVolunteers[index].address,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(ngoVolunteers[index].description),
                          )
                        ],
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
