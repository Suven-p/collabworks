// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collabworks/screens/hackathon_registration.dart';
import 'package:collabworks/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collabworks/screens/data.dart';

class OrganizationData {
  String name, description, website, email, phone, address, image;
  List<HackathonData> hackathons;
  OrganizationData({
    required this.name,
    required this.description,
    required this.website,
    required this.email,
    required this.phone,
    required this.address,
    required this.image,
    required this.hackathons,
  });
}

class OrganizationManagement extends StatefulWidget {
  const OrganizationManagement({Key? key}) : super(key: key);

  @override
  State<OrganizationManagement> createState() => _OrganizationManagementState();
}

class _OrganizationManagementState extends State<OrganizationManagement> {
  String profilePicture = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    var data = firestore
        .collection('organizations')
        .doc('MLH')
        .get()
        .then((DocumentSnapshot snapshot) {
      profilePicture = snapshot.get('image');
    });
  }

  final OrganizationData organizationData = OrganizationData(
      name: "MLH",
      description: "Be a hacker",
      website: "https://mlh.io",
      email: "hi@mlh.io",
      phone: "+9779834534342",
      address: "Organization Address",
      image: "assets/images/mlh.png",
      hackathons: [
        designathon(),
      ]);

  void deleteAtIndex(int index) {
    setState(() {
      organizationData.hackathons.removeAt(index);
    });
    debugPrint(organizationData.hackathons.length.toString());
  }

  Widget createTable(List<HackathonData> hackathons) {
    return DataTable(
      columns: const [
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Duration")),
        DataColumn(label: Text("Actions")),
      ],
      rows: hackathons
          .asMap()
          .map((idx, hackathon) => MapEntry(
              idx,
              DataRow(cells: [
                DataCell(Text(hackathon.name)),
                DataCell(
                    Text('${hackathon.startDate} to\n${hackathon.endDate}')),
                DataCell(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 32,
                          height: 32,
                          child: FloatingActionButton(
                            onPressed: () {},
                            tooltip: "Edit",
                            child: const Icon(
                              Icons.edit,
                            ),
                          )),
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: FloatingActionButton(
                              onPressed: () {
                                deleteAtIndex(idx);
                              },
                              tooltip: "Delete",
                              child: const Icon(
                                Icons.delete,
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ])))
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MainScaffold(
      drawer: const OrganizationDrawer(),
      appBar: DefaultAppBar(),
      child: Theme(
        data: Theme.of(context).copyWith(
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.roboto(
              color: Colors.white,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: size.width,
                  child: const Image(
                    image: AssetImage('assets/images/mlh.png'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const HackathonRegistrationScreen()));
                  },
                  child: const Text("Create new hackathon"),
                ),
                Text("Hackathons",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                createTable(organizationData.hackathons),
              ]),
        ),
      ),
    );
  }
}
