import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvitationScreen extends StatefulWidget {
  InvitationScreen({Key? key}) : super(key: key);

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
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
                  'Invitations',
                  style: GoogleFonts.poppins(
                    fontSize: 33,
                    color: Color(0xFFfffffe),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              opacity == 1
                  ? Opacity(
                      opacity: opacity,
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFb8c1ec),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/images/teamImg.png'),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MLH TEAM',
                                  style: GoogleFonts.roboto(
                                    color: Color(0xFF121629),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text('Invited by:- Armaan'),
                              ],
                            ),
                            Container(
                              width: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.deepPurple,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.done,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      showSnackBar(context,
                                          'Invitation accepted successfully!');
                                      opacity = 0;
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.deepPurple,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                      'No Invitations Yet!',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
