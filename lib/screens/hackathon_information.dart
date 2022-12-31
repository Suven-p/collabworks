import 'package:collabworks/ui/hacker_hackathons.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TeamData {
  String name;
  List<String> members;
  TeamData({required this.name, required this.members});
}

class HackathonData {
  String name, startDate, endDate, description;
  List<TeamData> teams;
  HackathonData({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.teams,
  });
}

class HackathonInformation extends StatelessWidget {
  HackathonInformation({Key? key}) : super(key: key);
  final HackathonData hackathonData = HackathonData(
    name: "Support-a-thon",
    startDate: "Dec 16, 2022",
    endDate: "Dec 18, 2022",
    description:
        "Let's bridge the gap for those with a variety of abilities and learn the best practices of creating accessible tech in all of our projects #a11y. We will be running a fun, activity-filled, open-themed digital hackathon. Feel free to hack on whatever you'd like or make it on-theme for the fun of it. These events are open to all skill levels, from beginners to the most veteran developers. While we'd love to have you build something on the theme, our themes are only here for inspiration. Please build whatever you'd like and focus on having fun!",
    teams: [
      TeamData(name: 'Team 1', members: ['Member 1', 'Member 2']),
      TeamData(name: 'Team 2', members: ['Member 3', 'Member 4']),
      TeamData(name: 'Team 3', members: ['Member 5', 'Member 6']),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    hackathonData.name,
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
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    hackathonData.description,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Table(
                  border: TableBorder.all(
                    color: Colors.white,
                  ),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Start Date",
                          style: TextStyle(
                            color: Color.fromARGB(255, 233, 208, 208),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hackathonData.startDate,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "End Date",
                          style: TextStyle(
                            color: Color.fromARGB(255, 233, 208, 208),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hackathonData.endDate,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Number of Teams",
                          style: TextStyle(
                            color: Color.fromARGB(255, 233, 208, 208),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          hackathonData.teams.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 30),
                TeamsTable(hackathonData.teams),
              ],
            ),
          )),
    );
  }
}

Widget TeamsTable(List<TeamData> teams) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Builder(
      builder: (context) {
        return DataTable(
          showBottomBorder: true,
          dataRowHeight: 60,
          columns: const [
            DataColumn(label: Text("S.N.")),
            DataColumn(label: Text("Team Name")),
            DataColumn(label: Text("Members")),
          ],
          rows: teams.map((team) {
            return DataRow(cells: [
              DataCell(Text((teams.indexOf(team) + 1).toString())),
              DataCell(Text(team.name)),
              DataCell(Text(team.members.join("\n"))),
            ]);
          }).toList(),
        );
      },
    ),
  );
}
