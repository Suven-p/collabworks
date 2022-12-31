import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackathonData {
  final String name;
  final String description;
  final String image;
  final String members;
  final String projects;

  const HackathonData(
      {required this.name,
      required this.description,
      required this.image,
      required this.members,
      required this.projects});
}

class HackerHackathons extends StatelessWidget {
  const HackerHackathons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<HackathonData> hackathons = [
      HackathonData(
          name: "Hackathon 1",
          description: "Hackathon 1 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
      HackathonData(
          name: "Hackathon 2",
          description: "Hackathon 2 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
      HackathonData(
          name: "Hackathon 3",
          description: "Hackathon 3 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
      HackathonData(
          name: "Hackathon 4",
          description: "Hackathon 4 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
      HackathonData(
          name: "Hackathon 5",
          description: "Hackathon 5 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
      HackathonData(
          name: "Hackathon 6",
          description: "Hackathon 6 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "6",
          projects: "1"),
    ];
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 8,
              ),
              child: Text('Hackathons',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Color(0xFFfffffe),
                  )),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: hackathons
                        .map((hackathon) => Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(hackathon.image, width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(hackathon.name,
                                        style: TextStyle(
                                          color: Color(0xFFb8c1ec),
                                        )),
                                    Text(hackathon.description,
                                        style: TextStyle(
                                          color: Color(0xFFb8c1ec),
                                        )),
                                  ],
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFeebbc3),
                                    ),
                                    onPressed: () => {},
                                    child: Text(
                                      'Check Details',
                                      style: TextStyle(
                                        color: Color(0xFF232946),
                                      ),
                                    )),
                              ],
                            )))
                        .toList()))
          ],
        ));
  }
}
