import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'data.dart';

class OrganizationHomepage extends StatelessWidget {
  final Stream<OrganizationData> orgDataStream;
  const OrganizationHomepage({required this.orgDataStream, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    launchMailto(String email) async {
      final mailtoLink = Mailto(
        to: [email],
      );
      await launchUrlString('$mailtoLink');
    }

    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: const DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
          data: Theme.of(context).copyWith(
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ),
          child: StreamBuilder<OrganizationData>(
              stream: orgDataStream,
              builder: (context, orgData) {
                if (orgData.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.2,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.network(orgData.data!.image),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          orgData.data!.name,
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
                          orgData.data!.description,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Card(
                        elevation: 2.0,
                        child: Container(
                          color: const Color(0xFF232946),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 0),
                              Container(
                                color: const Color(0xFF232946),
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                    onTap: (() async {
                                      await launchUrlString(
                                          orgData.data!.website);
                                    }),
                                    child: Text(
                                        'Website: ${orgData.data!.website}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: const Color(0xFFb8c1ec),
                                        ))),
                              ),
                              const SizedBox(height: 0),
                              Container(
                                color: const Color(0xFF232946),
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                    onTap: () async {
                                      await launchMailto(orgData.data!.email);
                                    },
                                    child: Text('Email: ${orgData.data!.email}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: const Color(0xFFb8c1ec),
                                        ))),
                              ),
                              const SizedBox(height: 0),
                              Container(
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                color: const Color(0xFF232946),
                                child: GestureDetector(
                                  onTap: (() async {
                                    await launchUrlString(
                                        'tel:${orgData.data!.phone}');
                                  }),
                                  child: Text(
                                    'Phone number: ${orgData.data!.phone}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: const Color(0xFFb8c1ec),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 0),
                              Container(
                                width: size.width * 0.9,
                                height: size.height * 0.05,
                                alignment: Alignment.centerLeft,
                                color: const Color(0xFF232946),
                                child: Text(
                                  'Address: ${orgData.data!.address}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: const Color(0xFFb8c1ec),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ]);
              })),
    );
  }
}
