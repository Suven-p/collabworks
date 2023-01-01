import 'dart:async';

class OrganizationData {
  String name, description, website, email, phone, address, image;
  OrganizationData({
    required this.name,
    required this.description,
    required this.website,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
  });
}

class TeamData {
  String name;
  List<String> members;
  TeamData({required this.name, required this.members});
}

class HackathonData {
  final String name;
  final String startDate, endDate;
  final String description;
  final String image;
  final String members;
  final String projects;
  final List<TeamData> teams;

  const HackathonData({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.members,
    required this.projects,
    required this.teams,
  });
}

Stream<OrganizationData> getOrganizationData(String orgName) {
  final OrganizationData organizationData = OrganizationData(
    name: "MLH",
    description: "Be a hacker",
    website: "https://mlh.io",
    email: "hi@mlh.io",
    phone: "+1-202-555-0184",
    address: "New York, NY, USA",
    image:
        "https://static.mlh.io/brand-assets/logo/official/mlh-logo-grayscale.png",
  );
  late final StreamController<OrganizationData> controller;
  controller = StreamController<OrganizationData>(
    onListen: () async {
      await Future<void>.delayed(const Duration(seconds: 1));
      controller.add(organizationData);
    },
  );
  return controller.stream;
}

HackathonData designathon() {
  return HackathonData(
    name: "Design-a-thon",
    description:
        "Let's bridge the gap for those with a variety of abilities and learn the best practices of creating accessible tech in all of our projects #a11y. We will be running a fun, activity-filled, open-themed digital hackathon. Feel free to hack on whatever you'd like or make it on-theme for the fun of it. These events are open to all skill levels, from beginners to the most veteran developers. While we'd love to have you build something on the theme, our themes are only here for inspiration. Please build whatever you'd like and focus on having fun!",
    startDate: "Dec 16, 2022",
    endDate: "Dec 18, 2022",
    image: "assets/images/thon.png",
    members: "5",
    projects: "1",
    teams: [
      TeamData(name: 'MLH TEAM', members: ['ARMAAN', 'NEVUS']),
      TeamData(name: 'ORCHID TEAM', members: ['POPSMOKE', 'SLASH']),
      TeamData(name: 'WINNERS TEAM', members: ['Rohit', 'Leon']),
    ],
  );
}

Stream<HackathonData> getHackathonData(String hackathonName) {
  late final StreamController<HackathonData> controller;
  controller = StreamController<HackathonData>(
    onListen: () async {
      await Future<void>.delayed(const Duration(seconds: 1));
      controller.add(designathon());
    },
  );
  return controller.stream;
}

Stream<List<HackathonData>> getHackathons(String orgName) {
  late final StreamController<List<HackathonData>> controller;
  controller = StreamController<List<HackathonData>>(
    onListen: () async {
      await Future<void>.delayed(const Duration(seconds: 1));
      controller.add([designathon()]);
    },
  );
  return controller.stream;
}
