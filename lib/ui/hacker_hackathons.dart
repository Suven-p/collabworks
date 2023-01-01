import 'package:collabworks/screens/hackathon_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/data.dart';

class HackerHackathons extends StatelessWidget {
  const HackerHackathons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HackathonData> hackathons = [
      designathon(),
    ];
    String truncateWithEllipsis(int cutoff, String myString) {
      return (myString.length <= cutoff)
          ? myString
          : '${myString.substring(0, cutoff)}...';
    }

    return Container(
        color: Color(0xFF232946),
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
                                  Image(
                                    image: AssetImage(
                                      hackathon.image,
                                    ),
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(hackathon.name,
                                          style: TextStyle(
                                            color: Color(0xFFb8c1ec),
                                          )),
                                      Text(
                                          truncateWithEllipsis(
                                              20, hackathon.description),
                                          style: TextStyle(
                                            color: Color(0xFFb8c1ec),
                                          )),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFeebbc3),
                                      ),
                                      onPressed: () => {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HackathonInformation(
                                                          hackathonDataStream:
                                                              getHackathonData(
                                                                  hackathon
                                                                      .name),
                                                        ))),
                                          },
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
        ));
  }
}
