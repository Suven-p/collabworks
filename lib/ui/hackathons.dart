import 'package:collabworks/screens/mainScaffold.dart';
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

class Hackathons extends StatelessWidget {
  const Hackathons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<HackathonData> hackathons = [
      HackathonData(
          name: "Hackathon 1",
          description: "Hackathon 1 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          projects: "1"),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: DefaultAppBar(),
      ),
      drawer: DefaultDrawer(),
      body: Container(
          color: Color(0xFF232946),
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
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
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    color: Color(0xFF232946),
                    child: Column(
                        children: hackathons
                            .map((hackathon) => Container(
                                color: Color(0xFF232946),
                                padding: const EdgeInsets.only(bottom: 310),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(hackathon.image, width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            .toList()),
                  ))
            ],
          )),
    );
  }
}
