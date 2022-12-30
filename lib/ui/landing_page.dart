import 'package:flutter/material.dart';
import 'signup.dart';
import 'signin.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void signUp() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signup()),
      );
    }

    void signIn() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signin()),
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
                child: const Text("Welcome to\nColabworks",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // color: Color.fromARGB(255, 244, 105, 94),
                    ))),
            Image.network(
                "https://cdn.discordapp.com/attachments/1057264312508481629/1058409871277555723/22500901072__1_-removebg-preview.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: signUp,
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 244, 105, 94),
                  ),
                  child: const Text("Sign Up"),
                ),
                TextButton(
                  onPressed: signIn,
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 244, 105, 94),
                  ),
                  child: const Text("Sign In"),
                ),
              ],
            )
          ],
        ));
  }
}
