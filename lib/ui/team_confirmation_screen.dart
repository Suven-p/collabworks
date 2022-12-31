import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamConfirmationScreen extends StatelessWidget {
  const TeamConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF232946),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: DefaultAppBar(),
      ),
      drawer: DefaultDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Choose the team',
                  style: GoogleFonts.lato(
                    color: Color(0xFFfffffe),
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Center(
                  child: Card(
                    elevation: 1.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFb8c1ec),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: size.height * 0.5,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showSnackBar(
                                context, 'Invitation sent successfully!');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('hi'),
                            ));
                            Fluttertoast.showToast(
                                msg: 'Invitation sent successfully!');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    HackerProfile(name: 'Armaan')));
                          },
                          child: ListTile(
                            tileColor: Color(0xFFeebbc3),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/teamImg.png'),
                            ),
                            title: Text(
                              'MLH TEAM',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
