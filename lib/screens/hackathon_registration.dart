import 'dart:io';

import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/models/hackathon_model.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'mainScaffold.dart';

class HackathonRegistrationScreen extends StatefulWidget {
  const HackathonRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<HackathonRegistrationScreen> createState() =>
      _HackathonRegistrationScreenState();
}

class _HackathonRegistrationScreenState
    extends State<HackathonRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hackathonNameController = TextEditingController();
  final _hackathonDescriptionController = TextEditingController();
  final _hackathonStartDate = TextEditingController();
  final _hackathonEndDate = TextEditingController();
  String? region = 'APAC';

  @override
  void dispose() {
    _hackathonNameController.dispose();
    _hackathonDescriptionController.dispose();
    super.dispose();
  }

  void createHackathon(BuildContext context) {
    HackathonModel model = HackathonModel(
        name: _hackathonNameController.text,
        region: region!,
        image: '',
        organizationName: 'MLH',
        startDate: _hackathonStartDate.text.toString(),
        endDate: _hackathonEndDate.text.toString());

    AuthController().createHackathon(model, context);
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

  Widget _buildForm() {
    String? requiredValidator(String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter a Hackathon Name";
      }
      return null;
    }

    String? anyValidator(String? value) {
      return null;
    }

    return Column(
      children: [
        image == null
            ? Container(
                height: 122,
                width: 350,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFeebbc3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {
                    pickImage(context);
                  },
                ),
              )
            : Container(
                height: 122,
                width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                      width: 160,
                    ),
                    IconButton(
                      onPressed: () {
                        pickImage(context);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        HackathonInputField(
          controller: _hackathonNameController,
          label: 'Hackathon Name',
          error: 'This field is required.',
          validator: requiredValidator,
          prefixIcon: const Icon(CupertinoIcons.profile_circled),
        ),
        const SizedBox(height: 20),
        HackathonInputField(
          controller: _hackathonDescriptionController,
          label: 'Hackathon Description',
          error: '',
          validator: anyValidator,
          prefixIcon: const Icon(
            CupertinoIcons.doc_text,
          ),
        ),
        const SizedBox(height: 20),
        DropdownButtonFormField(
            value: "NAEU",
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFb8c1ec),
              border: OutlineInputBorder(),
              counterStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              hintText: 'Region',
            ),
            dropdownColor: const Color(0xFFb8c1ec),
            style: const TextStyle(
              color: Colors.white,
            ),
            items: const [
              DropdownMenuItem(value: "APAC", child: Text('APAC')),
              DropdownMenuItem(value: "NAEU", child: Text('NA/EU')),
            ],
            onChanged: ((value) {
              setState(() {
                region = value;
              });
            })),
        const SizedBox(height: 20),
        TextField(
          controller: _hackathonStartDate,
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Color(0xFFb8c1ec),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
            counterStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'Start Date',
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100));
            if (date != null) {
              _hackathonStartDate.text = date.toString();
            }
          },
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _hackathonEndDate,
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            filled: true,
            fillColor: Color(0xFFb8c1ec),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
            counterStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            hintText: 'End Date',
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100));
            if (date != null) {
              _hackathonEndDate.text = date.toString();
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFeebbc3),
            ),
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.

                createHackathon(context);

                debugPrint(_formKey.currentState!.toString());
              }
            },
            child: Text(
              'Submit',
              style: GoogleFonts.roboto(
                color: const Color(0xFF232946),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        drawer: Drawer(
          backgroundColor: const Color(0xFF232946),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.

            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF232946),
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png')),
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
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Home',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              ListTile(
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Hackathons',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              ListTile(
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Find Team mates',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              ListTile(
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Invitations',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              ListTile(
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Profile',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              ListTile(
                tileColor: const Color(0xFF121629),
                title: Text(
                  'Settings',
                  style: GoogleFonts.roboto(
                    color: const Color(0xFFb8c1ec),
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xFF232946),
          title: const Text('CollabWorks'),
        ),
        child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(children: [
                const Text("Register Hackathon",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                const SizedBox(height: 20),
                Form(key: _formKey, child: _buildForm()),
              ]),
            )));
  }
}

class HackathonInputField extends StatelessWidget {
  const HackathonInputField({
    Key? key,
    required TextEditingController controller,
    required String label,
    required String error,
    required String? Function(String?) validator,
    Widget? prefixIcon,
  })  : _controller = controller,
        _label = label,
        _error = error,
        _prefixIcon = prefixIcon,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final String _error;
  final Widget? _prefixIcon;
  final String? Function(String?) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFb8c1ec),
        border: const OutlineInputBorder(),
        counterStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        hintText: _label,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: _prefixIcon,
      ),
      validator: _validator,
    );
  }
}
