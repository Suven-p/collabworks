import 'dart:io';

import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/models/organization_model.dart';
import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/organization_management.dart';
import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:collabworks/screens/organizaton_login_screen.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class OrganizationSignUpScreen extends StatefulWidget {
  @override
  State<OrganizationSignUpScreen> createState() =>
      _OrganizationSignUpScreenState();
}

class _OrganizationSignUpScreenState extends State<OrganizationSignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void signUp(BuildContext context) {
    OrganizationModel model = OrganizationModel(
        name: _nameController.text,
        image: '',
        email: _emailController.text,
        password: _passwordController.text);
    AuthController().registerOrganization(model, context);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OrganizationManagement()));
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
    return Scaffold(
        backgroundColor: const Color(0xFF232946),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: const Color(0xFF232946),
              height: size.height * 01.2,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Register the organization here',
                      style: GoogleFonts.roboto(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFfffffe),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Be a part of the community...',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFfffffe),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Choose the organization image',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFfffffe),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      height: 15,
                    ),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.profile_circled),
                        hintText: " Organization name",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _phoneNumberController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.phone),
                        hintText: " Organization Phone Number",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.mail),
                        hintText: " Organization E-Mail",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.padlock),
                        hintText: " Password",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.padlock),
                        hintText: " Confirm password",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())),
                          child: Text(
                            'Are you a hacker?',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: const Color(0xFFb8c1ec),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrganizationLogInScreen())),
                          child: Text(
                            'Already registered?',
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: const Color(0xFFb8c1ec),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        signUp(context);
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: size.height * 0.056,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFeebbc3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Sign Up!',
                          style: GoogleFonts.lato(
                            color: const Color(0xFF232946),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
