import "package:flutter/material.dart";

class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF232946), body: SingleChildScrollView(child));
  }
}
