import "package:flutter/material.dart";

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        textStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Sign In",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ]));
  }
}
