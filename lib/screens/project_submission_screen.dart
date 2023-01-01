import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/hacker_profile.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitProjectScreen extends StatefulWidget {
  @override
  _SubmitProjectScreenState createState() => _SubmitProjectScreenState();
}

class _SubmitProjectScreenState extends State<SubmitProjectScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _gitHubLink = "";
  String _description = "";
  String _teamName = "";

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Submit Your Project To Design-a-thon',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Color(0xFFb8c1ec),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Github Link',
                    filled: true,
                    fillColor: Color(0xFFb8c1ec),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a GitHub link';
                    }
                    return null;
                  },
                  onSaved: (value) => _gitHubLink = value!,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Team name',
                    filled: true,
                    fillColor: Color(0xFFb8c1ec),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a team name';
                    }
                    return null;
                  },
                  onSaved: (value) => _description = value!,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    filled: true,
                    fillColor: Color(0xFFb8c1ec),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) => _teamName = value!,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save the project to Firebase here

                      firestore.collection('projects').doc(_teamName).set({
                        'name': _name,
                        'gitHubLink': _gitHubLink,
                        'description': _description,
                        'teamName': _teamName,
                      });
                      showSnackBar(context, 'Submitted Project!');
                      Fluttertoast.showToast(msg: 'Submitted Project!');
                      submittedProject = true;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HackerProfile(name: 'Armaan')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
