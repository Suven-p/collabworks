import 'package:collabworks/ui/hacker_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindTeammatesScreen extends StatelessWidget {
  const FindTeammatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF232946),
      appBar: AppBar(
        backgroundColor: Color(0xFF232946),
        title: const Text('CollabWorks'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
                onTap: () {
                  debugPrint("Avatar tapped");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FindTeammatesScreen()));
                },
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ))),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF232946),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.

          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF232946),
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png')),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text("",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HackerProfile(name: 'Armaan')));
              },
              child: ListTile(
                tileColor: Color(0xFF121629),
                title: Text(
                  'Home',
                  style: GoogleFonts.roboto(
                    color: Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HackerProfile(name: 'Armaan')));
                },
              ),
            ),
            Divider(
              height: 5,
              thickness: 1,
            ),
            ListTile(
              tileColor: Color(0xFF121629),
              title: Text(
                'Hackathons',
                style: GoogleFonts.roboto(
                  color: Color(0xFFb8c1ec),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
              thickness: 1,
            ),
            ListTile(
              tileColor: Color(0xFF121629),
              title: Text(
                'Find Team mates',
                style: GoogleFonts.roboto(
                  color: Color(0xFFb8c1ec),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
              thickness: 1,
            ),
            ListTile(
              tileColor: Color(0xFF121629),
              title: Text(
                'Invitations',
                style: GoogleFonts.roboto(
                  color: Color(0xFFb8c1ec),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
              thickness: 1,
            ),
            ListTile(
              tileColor: Color(0xFF121629),
              title: Text(
                'Profile',
                style: GoogleFonts.roboto(
                  color: Color(0xFFb8c1ec),
                ),
              ),
              onTap: () {},
            ),
            Divider(
              height: 5,
              thickness: 1,
            ),
            ListTile(
              tileColor: Color(0xFF121629),
              title: Text(
                'Settings',
                style: GoogleFonts.roboto(
                  color: Color(0xFFb8c1ec),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
