import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      // ignore: prefer_const_literals_to_create_immutables

      children: [
        SizedBox(height: 300),
        Icon(CupertinoIcons.add),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.profile_circled),
            hintText: " Organisation Name",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.phone),
            hintText: " Phone Number",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.mail),
            hintText: " E-Mail",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.padlock),
            hintText: " password",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(CupertinoIcons.padlock),
            hintText: " confirm password",
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("CREATE"),
        ),
      ],
    ));
  }
}
