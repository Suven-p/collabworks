import 'dart:async';

import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/signup_screen.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => firebaseAuth.currentUser != null
                  ? const HackerProfile(name: "Armaan")
                  : LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void signUp() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    }

    void signIn() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }

    return Material(
        color: const Color(0xFF232946),
        textStyle: const TextStyle(
          color: Color(0xFFfffffe),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 30, top: 60),
                  child: Text("Welcome to\nCollabWorks",
                      style: GoogleFonts.poppins(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        // color: Color.fromARGB(255, 244, 105, 94),
                      ))),
              Container(
                width: size.width,
                height: size.height * 0.34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: signUp,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 244, 105, 94),
                    ),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.roboto(
                        color: const Color(0xFFb8c1ec),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: signIn,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
