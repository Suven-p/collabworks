import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      // ignore: prefer_const_literals_to_create_immutables

      children: [
        const SizedBox(height: 300),
        const Icon(CupertinoIcons.add),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.profile_circled),
            hintText: " Organisation Name",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.phone),
            hintText: " Phone Number",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.mail),
            hintText: " E-Mail",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.padlock),
            hintText: " password",
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.padlock),
            hintText: " confirm password",
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("CREATE"),
        ),
      ],
    ));
  }
}
