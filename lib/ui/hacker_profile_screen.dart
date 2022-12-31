import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/find_teammates_screen.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/ui/hacker_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackerProfileScreen extends StatelessWidget {
  const HackerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF232946),
      appBar: AppBar(
        backgroundColor: Color(0xFF232946),
        title: const Text('CollabWorks'),
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
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => FindTeammatesScreen()));
              },
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
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: size.height * 0.2,
                color: Color(0xFFeebbc3),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://previews.123rf.com/images/kritchanut/kritchanut1406/kritchanut140600093/29213195-male-silhouette-avatar-profile-picture.jpg'),
                    ),
                  ),
                ),
              ),
              Container(
                color: Color(0xFF232946),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: size.width * 0.5,
                        height: size.height * 0.06,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '6 friends',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        color: Color(0xFF232946),
                        child: Center(
                          child: Text(
                            'Armaan',
                            style: GoogleFonts.roboto(
                              fontSize: 32,
                              color: Color(0xFFfffffe),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 2.0,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: size.width * 0.9,
                                height: size.height * 0.03,
                                color: Color(0xFF232946),
                                child: Text(
                                  'Email: armaan33000@gmail.com',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color(0xFFb8c1ec),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 0),
                            Container(
                              child: Container(
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                color: Color(0xFF232946),
                                child: Text(
                                  'Age: 18',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFb8c1ec),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Container(
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                color: Color(0xFF232946),
                                child: Text(
                                  'Phone number: 7009280622',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFb8c1ec),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
