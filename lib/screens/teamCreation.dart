import 'dart:io';

import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/models/organization_model.dart';
import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:collabworks/screens/organizaton_login_screen.dart';
import 'package:collabworks/ui/hacker_scaffold.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:editable/editable.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class TeamCreationScreen extends StatefulWidget {
  @override
  State<TeamCreationScreen> createState() => _TeamCreationScreenState();
}

class _TeamCreationScreenState extends State<TeamCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _member1Controller = TextEditingController();
  final TextEditingController _member2Controller = TextEditingController();
  final TextEditingController _member3Controller = TextEditingController();
  final TextEditingController _member4Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _member1Controller.dispose();
    _member2Controller.dispose();
    _member3Controller.dispose();
    _member4Controller.dispose();
  }

  void pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file == null) {
      showSnackBar(context, 'Please choose an image');
    } else {
      setState(() {
        File newFile = File(file.path);
        image = newFile;
        print('img is $image');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainScaffold(
        appBar: DefaultAppBar(),
        drawer: DefaultDrawer(),
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xFFfffffe),
            textTheme: GoogleFonts.robotoTextTheme().apply(
              bodyColor: const Color(0xFFfffffe),
              displayColor: const Color(0xFFfffffe),
            ),
          ),
          child: Container(
            color: const Color(0xFF232946),
            height: size.height * 0.8,
            padding: EdgeInsets.only(top: 18.0, left: 15.0, right: 15.0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Register your Team',
                  style: GoogleFonts.roboto(
                    fontSize: 31,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFfffffe),
                  ),
                ),
                const SizedBox(height: 20),
                TeamFormField(_nameController, "Team Name"),
                const SizedBox(height: 20),
                TeamFormField(_descriptionController, "Team Description"),
                const SizedBox(height: 20),
                Text(
                  'Team Members',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFfffffe),
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TeamMemberFormField(_member1Controller),
              ],
            ),
          ),
        ));
  }
}

class TeamFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  TeamFormField(
    this.controller,
    this.hint, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFb8c1ec),
        border: OutlineInputBorder(),
        prefixIcon: Icon(CupertinoIcons.text_append),
        hintText: hint,
      ),
    );
  }
}

class TeamMemberFormField extends StatefulWidget {
  final TextEditingController controller;
  TeamMemberFormField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  State<TeamMemberFormField> createState() => _TeamMemberFormFieldState();
}

class _TeamMemberFormFieldState extends State<TeamMemberFormField> {
  final _editableKey = GlobalKey<EditableState>();

  final rows = [
    {
      "name": "James Peter",
      "email": "james@email.com",
    },
  ];

//Headers or Columns
  final headers = [
    {"title": "\nName", 'index': 1, "key": "name", "widthFactor": 0.3},
    {"title": "\nEmail", 'index': 2, "key": "email", "widthFactor": 0.4},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Editable(
                key: _editableKey,
                borderWidth: 0.1,
                borderColor: Colors.grey,
                columnCount: 2,
                rowCount: rows.length,
                columns: headers,
                rows: rows,
                showCreateButton: true,
                createButtonIcon:
                    Icon(Icons.add, color: Color.fromARGB(221, 69, 187, 0)),
                createButtonColor: Color(0xFF232946),
                showSaveIcon: true,
                saveIcon: Icons.save,
                saveIconColor: Colors.blue,
                saveIconSize: 30,
                // onRowSaved: (value) {
                //   // if (value.get('row') > rows.length - 1) {
                //   //   rows.add({
                //   //     "name": value['name'],
                //   //     "email": value['email'],
                //   //   });
                //   // } else {
                //   //   rows[value['row']]['name'] = value['name'];
                //   //   rows[value['row']]['email'] = value['email'];
                //   // }

                //   print({'action': 'save', 'value': value});
                // },
                onSubmitted: (value) {
                  //new line
                  print(rows);
                  print(_editableKey.currentState?.editedRows ??
                      'nkone'); //you can grab this data to store anywhere
                },
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(rows);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
