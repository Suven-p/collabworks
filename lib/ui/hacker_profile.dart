import 'package:collabworks/ui/hacker_hackathons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'hacker_scaffold.dart';
import 'hacker_teams.dart';

class HackerProfile extends StatelessWidget {
  final String name;
  const HackerProfile({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // String date = '${now.weekday} ${now.day}/${now.month}/${now.year}';
    String date = DateFormat('EEEE, d MMMM yyyy').format(now);
    return HackerScaffold(
        avatar: const NetworkImage("https://thispersondoesnotexist.com/image"),
        child: Container(
            alignment: Alignment.topLeft,
            child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hey $name',
                        style: const TextStyle(
                          fontSize: 30,
                        )),
                    Text(
                      date,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    HackerTeamsShort(),
                    HackerHackathons(),
                  ],
                ))));
  }
}
