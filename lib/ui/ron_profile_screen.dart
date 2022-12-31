import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/find_teammates_screen.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/ui/hacker_scaffold.dart';
import 'package:collabworks/ui/team_confirmation_screen.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RonProfileScreen extends StatefulWidget {
  const RonProfileScreen({Key? key}) : super(key: key);

  @override
  State<RonProfileScreen> createState() => _RonProfileScreenState();
}

class _RonProfileScreenState extends State<RonProfileScreen> {
  String hackerName = "";
  String hackerEmail = "";
  String hackerAge = "";
  String hackerPhoneNumber = "";
  String hackerProfilePicture = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    var data = firestore
        .collection('hackers')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) {
      hackerProfilePicture = snapshot.get('profilePicture');
      hackerName = snapshot.get('name');
      hackerAge = snapshot.get('age');
      hackerEmail = snapshot.get('email');
      hackerPhoneNumber = snapshot.get('phoneNumber');
      setState(() {});
    });
  }

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
                      backgroundColor: Colors.black,
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/ron.png'),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            width: size.width * 0.4,
                            height: size.height * 0.06,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '6 Friends',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
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
                              'Add Friend',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Container(
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        color: Color(0xFF232946),
                        child: Center(
                          child: Text(
                            'Ron',
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
                                  'Email: ron33000@gmail.com',
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
                                  'Age: $hackerAge',
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
                                  'Phone number: 7837833000',
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
              const SizedBox(
                height: 30,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TeamConfirmationScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 38),
                    height: size.height * 0.08,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFeebbc3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      'Add as a Team mate',
                      style: GoogleFonts.roboto(
                        color: Color(0xFF232946),
                        fontSize: 22,
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
