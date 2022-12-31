import 'package:flutter/material.dart';

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

class HackerTeamsShort extends StatelessWidget {
  const HackerTeamsShort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<TeamData> teams = [
      TeamData(
          name: "Team 1",
          description: "Team 1 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          hackathons: "2",
          projects: "1"),
      TeamData(
          name: "Team 2",
          description: "Team 2 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          hackathons: "2",
          projects: "1"),
      TeamData(
          name: "Team 3",
          description: "Team 3 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          hackathons: "2",
          projects: "1"),
      TeamData(
          name: "Team 4",
          description: "Team 4 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          hackathons: "2",
          projects: "1"),
      TeamData(
          name: "Team 5",
          description: "Team 5 description",
          image: "https://thispersondoesnotexist.com/image",
          members: "5",
          hackathons: "2",
          projects: "1"),
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Text("Teams", style: const TextStyle(fontSize: 20)),
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
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(3),
                height: 130,
                child: Column(children: [
                  CircleAvatar(
                    radius: 58,
                    backgroundImage: NetworkImage(teams[index].image),
                  ),
                  Text(teams[index].name)
                ]),
              );
            },
          ))
    ]);
  }
}
