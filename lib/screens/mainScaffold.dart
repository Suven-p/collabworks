import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collabworks/ui/find_teammates_screen.dart';
import 'package:collabworks/ui/hackathons.dart';
import 'package:collabworks/ui/hacker_hackathons.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/ui/hacker_profile_screen.dart';
import 'package:collabworks/ui/invitation_screen.dart';
import 'package:collabworks/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class DefaultDrawer extends StatefulWidget {
  const DefaultDrawer({super.key});

  @override
  State<DefaultDrawer> createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF232946),
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
              image:
                  DecorationImage(image: AssetImage('assets/images/logo.png')),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Text("",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Home',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HackerProfile(name: 'Armaan')));
            },
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Hackathons',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Hackathons()));
            },
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Find Team mates',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => FindTeammatesScreen()));
            },
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Invitations',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => InvitationScreen()));
            },
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Profile',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HackerProfileScreen()));
            },
          ),
          const Divider(
            height: 5,
            thickness: 1,
          ),
          ListTile(
            tileColor: const Color(0xFF121629),
            title: Text(
              'Settings',
              style: GoogleFonts.roboto(
                color: const Color(0xFFb8c1ec),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DefaultAppBar extends StatefulWidget {
  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF232946),
      title: const Text('CollabWorks'),
    );
  }
}

class MainScaffold extends StatefulWidget {
  final Widget child;
  final Widget appBar;
  final Widget drawer;
  const MainScaffold({
    required this.child,
    Key? key,
    required this.drawer,
    required this.appBar,
  }) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: const Color(0xFF232946),
        textStyle: const TextStyle(
          color: Color(0xFFfffffe),
        ),
        child: Scaffold(
            drawer: widget.drawer,
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, kToolbarHeight),
              child: widget.appBar,
            ),
            backgroundColor: const Color(0xFF232946),
            body: SingleChildScrollView(
              child: widget.child,
            )));
  }
}
