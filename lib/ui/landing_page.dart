import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
        color: Colors.black,
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 244, 105, 94),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 40, top: 60),
                child: const Text("Welcome to\nColabWorks",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // color: Color.fromARGB(255, 244, 105, 94),
                    ))),
            Container(
              width: size.width,
              height: size.height * 0.34,
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        "https://cdn.discordapp.com/attachments/1057264312508481629/1058409871277555723/22500901072__1_-removebg-preview.png",
                        width: size.width * 0.6)
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: signUp,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 244, 105, 94),
                  ),
                  child: const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: signIn,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 244, 105, 94),
                  ),
                  child: const Text("Sign In"),
                ),
              ],
            )
          ],
        ));
  }
}
