import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/screens/login_screen.dart';
import 'package:collabworks/screens/organization_signup_screen.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class OrganizationLogInScreen extends StatefulWidget {
  const OrganizationLogInScreen({super.key});

  @override
  State<OrganizationLogInScreen> createState() =>
      _OrganizationLogInScreenState();
}

class _OrganizationLogInScreenState extends State<OrganizationLogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login(BuildContext context) {
    AuthController().loginOrganization(
        _passwordController.text, _emailController.text, context);
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
              height: size.height * 0.8,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables

                  children: [
                    const SizedBox(
                      height: 160,
                    ),
                    Text(
                      'Login your organization here',
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
                                      OrganizationSignUpScreen())),
                          child: Text(
                            'New Organization?',
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
                        login(context);
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
                          'Log In!',
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
