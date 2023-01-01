import 'package:collabworks/screens/hackathon_information.dart';
import 'package:collabworks/screens/landing_screen.dart';
import 'package:collabworks/screens/messages_screen.dart';
import 'package:collabworks/screens/project_submission_screen.dart';
import 'package:collabworks/screens/teamCreation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/data.dart';
import 'ui/hacker_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
