import 'dart:io';

import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/models/hacker_model.dart';
import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void signUp(BuildContext context) {
    HackerModel model = HackerModel(
        name: _nameController.text,
        age: _ageController.text,
        phoneNumber: _phoneNumberController.text,
        profilePicture: '',
        email: _emailController.text,
        password: _passwordController.text);

    print(model);

    try {
      AuthController().signUp(model, context);
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    print('success');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 1,
              decoration: const BoxDecoration(
                // border: Border.all(
                //   color: Colors.white,
                // ),
                color: Color(0xFF232946),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We enjoy new hackers coming!',
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
                    Stack(
                      children: [
                        image == null
                            ? const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://previews.123rf.com/images/kritchanut/kritchanut1406/kritchanut140600093/29213195-male-silhouette-avatar-profile-picture.jpg'),
                                radius: 40,
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 40,
                              ),
                        Positioned(
                          right: -10,
                          top: 40,
                          child: IconButton(
                            onPressed: () {
                              pickImage(context);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
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
                        hintText: " Username",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _ageController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFb8c1ec),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.number),
                        hintText: " Age",
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
                        hintText: " Phone Number",
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
                        hintText: " E-Mail",
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
                            'Already have an account?',
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
                                      OrganizationSignUpScreen())),
                          child: Text(
                            'An Organization?',
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
