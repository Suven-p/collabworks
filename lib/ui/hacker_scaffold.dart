import 'package:flutter/material.dart';

class HackerScaffold extends StatelessWidget {
  final Widget child;
  final ImageProvider<Object> avatar;
  const HackerScaffold({required this.child, required this.avatar, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ColabWorks',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ColabWorks'),
            actions: [
              GestureDetector(
                  onTap: () {
                    debugPrint("Avatar tapped");
                  },
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: CircleAvatar(
                        backgroundImage: avatar,
                      )))
            ],
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.discordapp.com/attachments/1057264312508481629/1058409871277555723/22500901072__1_-removebg-preview.png")),
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text("",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Hackathons'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(child: child),
        ));
  }
}
