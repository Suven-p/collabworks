import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/find_teammates_screen.dart';
import 'package:collabworks/ui/hackathons.dart';
import 'package:collabworks/ui/hacker_hackathons.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hacker_profile_screen.dart';

class HackerScaffold extends StatelessWidget {
  final Widget child;
  final ImageProvider<Object> avatar;
  const HackerScaffold({required this.child, required this.avatar, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CollabWorks',
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: DefaultAppBar(),
          ),
          drawer: DefaultDrawer(),
          body: SingleChildScrollView(child: child),
        ));
  }
}
