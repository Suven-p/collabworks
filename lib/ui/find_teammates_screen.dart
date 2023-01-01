import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/ui/hacker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindTeammatesScreen extends StatelessWidget {
  const FindTeammatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: DefaultAppBar(),
      ),
      drawer: DefaultDrawer(),
      backgroundColor: const Color(0xFF232946),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Work with a great hacker just like you!',
                style: GoogleFonts.poppins(
                  color: const Color(0xFFfffffe),
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const HackerWidget(),
          ],
        ),
      ),
    );
  }
}
