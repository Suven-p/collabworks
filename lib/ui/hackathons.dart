import 'package:collabworks/screens/hackathon_information.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/screens/organization_management.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/data.dart';

class Hackathons extends StatelessWidget {
  final Stream<List<HackathonData>> hackathonDataStream;
  const Hackathons({required this.hackathonDataStream, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: DefaultAppBar(),
      ),
      drawer: OrganizationDrawer(),
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
                    child: StreamBuilder<List<HackathonData>>(
                        stream: hackathonDataStream,
                        builder: (context, snapshot) {
                          final hackathons = snapshot.data ?? [];
                          return Column(
                              children: hackathons.map((hackathon) {
                            String truncateWithEllipsis(
                                int cutoff, String myString) {
                              return (myString.length <= cutoff)
                                  ? myString
                                  : '${myString.substring(0, cutoff)}...';
                            }

                            return Container(
                              color: Color(0xFF232946),
                              padding: const EdgeInsets.only(bottom: 310),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: AssetImage(hackathon.image),
                                      height: 40,
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
                                        onPressed: () {
                                          final String name = hackathon.name;
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HackathonInformation(
                                                          viewPoint:
                                                              'organization',
                                                          hackathonDataStream:
                                                              getHackathonData(
                                                                  name))));
                                        },
                                        child: Text(
                                          'Check Details',
                                          style: TextStyle(
                                            color: Color(0xFF232946),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }).toList());
                        }),
                  ))
            ],
          )),
    );
  }
}
