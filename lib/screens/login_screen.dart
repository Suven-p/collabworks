import 'package:collabworks/controllers/auth_controller.dart';
import 'package:collabworks/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login(BuildContext context) {
    AuthController()
        .logIn(_emailController.text, _passwordController.text, context);
  }

  // const MyLogin({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Color(0xFF232946),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
                height: size.height * 0.56,
                width: 300,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xFF232946),
                  // border: Border.all(
                  //   color: Colors.white,
                  // ),
                ),
                // color: Colors.blueGrey,
                transformAlignment: Alignment.center,
                child: Column(
                  children: [
                    // Icon(CupertinoIcons.mail)
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('WELCOME BACK!',
                          style: GoogleFonts.roboto(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFfffffe),
                          )),
                    ),
                    const SizedBox(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('We are happy to see you back!',
                          style: GoogleFonts.roboto(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFfffffe),
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 90,
                        width: 280,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFb8c1ec),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(CupertinoIcons.mail),
                            hintText: " E-Mail",
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 90,
                      width: 280,
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFb8c1ec),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(CupertinoIcons.padlock_solid),
                            hintText: "Password"),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen())),
                        child: Text(
                          'New to CollabWorks?',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Color(0xFFb8c1ec),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
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
                        child: Text(
                          'Log In!',
                          style: GoogleFonts.lato(
                            color: Color(0xFF232946),
                            fontSize: 16,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFeebbc3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
