import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'data.dart';

class HackathonInformation extends StatelessWidget {
  final Stream<HackathonData> hackathonDataStream;
  final String viewPoint;

  const HackathonInformation(
      {required this.viewPoint, required this.hackathonDataStream, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: const DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
          child: StreamBuilder<HackathonData>(
              stream: hackathonDataStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final hackathonData = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              hackathonData.name,
                              style: GoogleFonts.roboto(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            // ElevatedButton(onPressed: () {}, child: Text('Join'))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          hackathonData.description,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Table(
                        border: TableBorder.all(
                          color: Colors.white,
                        ),
                        children: [
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(height: 30),
                      (viewPoint == 'hacker')
                          ? ElevatedButton(
                              onPressed: () {},
                              child: const Text('Join Hackathon'))
                          : TeamsTable(hackathonData.teams),
                    ],
                  ),
                );
              })),
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