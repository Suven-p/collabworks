import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamData {
  final String name;
  final String description;
  final String image;
  final String members;
  final String hackathons;
  final String projects;

  const TeamData(
      {required this.name,
      required this.description,
      required this.image,
      required this.members,
      required this.hackathons,
      required this.projects});
}

class HackerTeamsShort extends StatefulWidget {
  const HackerTeamsShort({Key? key}) : super(key: key);

  @override
  State<HackerTeamsShort> createState() => _HackerTeamsShortState();
}

class _HackerTeamsShortState extends State<HackerTeamsShort> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const List<TeamData> teams = [
      TeamData(
          name: "MLH TEAM",
          description: "Create something good us",
          image: "assets/images/teamImg.png",
          members: "5",
          hackathons: "1",
          projects: "1"),
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text("Teams",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Color(0xFFfffffe),
              )),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: const Text("See all",
                  style: const TextStyle(color: Colors.blue)))
        ],
      ),
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3),
          height: 148,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(0, 158, 173, 249),
          ),
          child: ListView.builder(
            itemCount: 1,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(3),
                height: 130,
                child: Column(children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage(teams[index].image),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      teams[index].name,
                      style: TextStyle(
                        color: Color(0xFFb8c1ec),
                      ),
                    ),
                  )
                ]),
              );
            },
          ))
    ]);
  }
}
