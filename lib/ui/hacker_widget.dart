import 'package:collabworks/ui/ron_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HackerWidget extends StatelessWidget {
  const HackerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Color(0xFFb8c1ec),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/mlh.png'),
                radius: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ron',
                  style: GoogleFonts.lato(
                    fontSize: 22,
                    color: Color(0xFF121629),
                  ),
                ),
                Text(
                  'ron33000@gmail.com',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Color(0xFF121629),
                  ),
                ),
              ],
            ),
            Container(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RonProfileScreen()));
              },
              child: Container(
                width: 80,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'View Profile',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
