import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/mainScaffold.dart';

class TeamData {
  String name, hackathon, image, description;
  List<String> members;
  TeamData({
    required this.name,
    required this.members,
    required this.hackathon,
    required this.image,
    required this.description,
  });
}

class TeamManagement extends StatelessWidget {
  TeamManagement({Key? key}) : super(key: key);
  final TeamData teamData = TeamData(
    name: "Team 1",
    description: "A ragtag bunch of so-called full-stack developers",
    hackathon: "Support-a-thon",
    members: ['Member 1', 'Member 2', 'Member 3'],
    image:
        'https://images.pexels.com/photos/3184418/pexels-photo-3184418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: const DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
          data: Theme.of(context).copyWith(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 80, child: Image.network(teamData.image)),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    teamData.name,
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(teamData.description,
                    style: GoogleFonts.roboto(color: Colors.white)),
                const SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Text('Hackathon',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 20),
                  Text(teamData.hackathon,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                      )),
                ]),
                const SizedBox(height: 30),
                Text(
                  'Members',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: teamData.members
                        .map((String member) => Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              alignment: Alignment.topLeft,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      member,
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.message,
                                      color: Color.fromARGB(255, 18, 184, 245),
                                    )
                                  ]),
                            ))
                        .toList()),
              ],
            ),
          )),
    );
  }
}

Widget TeamInfo(TeamData teams) {
  return Table(children: [
    TableRow(
      children: [
        const Text("Hackathon"),
        Text(teams.hackathon),
      ],
    )
  ]);
}
