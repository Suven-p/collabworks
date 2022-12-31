import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collabworks/ui/hacker_hackathons.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'hacker_scaffold.dart';
import 'hacker_teams.dart';

class HackerProfile extends StatefulWidget {
  final String name;
  const HackerProfile({required this.name, Key? key}) : super(key: key);

  @override
  State<HackerProfile> createState() => _HackerProfileState();
}

class _HackerProfileState extends State<HackerProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // String date = '${now.weekday} ${now.day}/${now.month}/${now.year}';
    String date = DateFormat('EEEE, d MMMM yyyy').format(now);
    return HackerScaffold(
        avatar: const NetworkImage("https://thispersondoesnotexist.com/image"),
        child: Container(
            color: Color(0xFF232946),
            alignment: Alignment.topLeft,
            child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hey ${widget.name}',
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xFFfffffe),
                        )),
                    Text(
                      date,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: HackerTeamsShort(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: HackerHackathons(),
                    ),
                  ],
                ))));
  }
}
