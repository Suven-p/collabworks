import 'package:collabworks/ui/hacker_hackathons.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrganizationData {
  String name, description, website, email, phone, address, image;
  OrganizationData({
    required this.name,
    required this.description,
    required this.website,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
  });
}

class OrganizationHomepage extends StatelessWidget {
  OrganizationHomepage({Key? key}) : super(key: key);
  final OrganizationData organizationData = OrganizationData(
    name: "MLH",
    description: "Be a hacker",
    website: "https://mlh.io",
    email: "hi@mlh.io",
    phone: "+9779834534342",
    address: "Organization Address",
    image: "https://thispersondoesnotexist.com/image",
  );
  @override
  Widget build(BuildContext context) {
    launchMailto() async {
      final mailtoLink = Mailto(
        to: [organizationData.email],
      );
      await launchUrlString('$mailtoLink');
    }

    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
          child: Container(
              child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.2,
              color: Color(0xFFeebbc3),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: CircleAvatar(
                  radius: 43,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('${organizationData.image}'),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    organizationData.name,
                    style: GoogleFonts.roboto(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    organizationData.description,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  elevation: 2.0,
                  child: Container(
                    color: Color(0xFF232946),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 0),
                        Container(
                          color: Color(0xFF232946),
                          width: size.width * 0.9,
                          height: size.height * 0.05,
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: (() async {
                                await launchUrlString(organizationData.website);
                              }),
                              child:
                                  Text('Website: ${organizationData.website}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Color(0xFFb8c1ec),
                                      ))),
                        ),
                        const SizedBox(height: 0),
                        Container(
                          color: Color(0xFF232946),
                          width: size.width * 0.9,
                          height: size.height * 0.05,
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: launchMailto,
                              child: Text('Email: ${organizationData.email}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Color(0xFFb8c1ec),
                                  ))),
                        ),
                        const SizedBox(height: 0),
                        Container(
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.05,
                            alignment: Alignment.centerLeft,
                            color: Color(0xFF232946),
                            child: GestureDetector(
                              onTap: (() async {
                                await launchUrlString(
                                    'tel:${organizationData.phone}');
                              }),
                              child: Text(
                                'Phone number: ${organizationData.phone}',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Color(0xFFb8c1ec),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        Container(
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.05,
                            alignment: Alignment.centerLeft,
                            color: Color(0xFF232946),
                            child: Text(
                              'Address: ${organizationData.address}',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Color(0xFFb8c1ec),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]))),
    );
  }
}
