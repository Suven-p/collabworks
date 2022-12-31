import "package:flutter/material.dart";

class MainScaffold extends StatelessWidget {
  final Widget child;
  final Widget appBar;
  final Widget drawer;
  const MainScaffold({
    required this.child,
    Key? key,
    required this.drawer,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFF232946),
        textStyle: const TextStyle(
          color: Color(0xFFfffffe),
        ),
        child: Scaffold(
            drawer: drawer,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: appBar,
            ),
            backgroundColor: Color(0xFF232946),
            body: SingleChildScrollView(
              child: child,
            )));
  }
}
