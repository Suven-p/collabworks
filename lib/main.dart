import 'package:collabworks/screens/hackathon_information.dart';
import 'package:collabworks/screens/landing_screen.dart';
import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/organization_homepage.dart';
import 'package:collabworks/screens/organization_management.dart';
import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:collabworks/screens/organizaton_login_screen.dart';
import 'package:collabworks/screens/signup_screen.dart';
import 'package:collabworks/ui/hacker_hackathons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/hackathon_registration.dart';

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
