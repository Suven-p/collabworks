import 'package:collabworks/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

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

class HackathonData {
  String name, startDate, endDate, description;
  HackathonData({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.description,
  });
}

class OrganizationManagement extends StatefulWidget {
  OrganizationManagement({Key? key}) : super(key: key);

  @override
  State<OrganizationManagement> createState() => _OrganizationManagementState();
}

class _OrganizationManagementState extends State<OrganizationManagement> {
  final OrganizationData organizationData = OrganizationData(
      name: "MLH",
      description: "Be a hacker",
      website: "https://mlh.io",
      email: "hi@mlh.io",
      phone: "+9779834534342",
      address: "Organization Address",
      image: "https://thispersondoesnotexist.com/image",
      hackathons: [
        HackathonData(
            name: "Hackathon 1",
            startDate: "10/10",
            endDate: "10/11",
            description: "Description"),
        HackathonData(
            name: "Hackathon 2",
            startDate: "10/12",
            endDate: "10/13",
            description: "Description"),
        HackathonData(
            name: "Hackathon 3",
            startDate: "10/13",
            endDate: "10/14",
            description: "Description"),
        HackathonData(
            name: "Hackathon 4",
            startDate: "10/14",
            endDate: "10/15",
            description: "Description"),
        HackathonData(
            name: "Hackathon 5",
            startDate: "10/15",
            endDate: "10/16",
            description: "Description"),
        HackathonData(
            name: "Hackathon 6",
            startDate: "10/10",
            endDate: "10/11",
            description: "Description"),
        HackathonData(
            name: "Hackathon 7",
            startDate: "10/12",
            endDate: "10/13",
            description: "Description"),
        HackathonData(
            name: "Hackathon 8",
            startDate: "10/13",
            endDate: "10/14",
            description: "Description"),
        HackathonData(
            name: "Hackathon 9",
            startDate: "10/14",
            endDate: "10/15",
            description: "Description"),
        HackathonData(
            name: "Hackathon 10",
            startDate: "10/15",
            endDate: "10/16",
            description: "Description"),
      ]);

  void deleteAtIndex(int index) {
    setState(() {
      organizationData.hackathons.removeAt(index);
    });
    debugPrint(organizationData.hackathons.length.toString());
  }

  Widget createTable(List<HackathonData> hackathons) {
    return DataTable(
      columns: [
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
                            child: Icon(
                              Icons.edit,
                            ),
                          )),
                      SizedBox(width: 20),
                      SizedBox(
                          width: 32,
                          height: 32,
                          child: FloatingActionButton(
                            onPressed: () {
                              deleteAtIndex(idx);
                            },
                            tooltip: "Delete",
                            child: Icon(
                              Icons.delete,
                            ),
                          )),
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
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: size.width,
                  child: Image.network(organizationData.image),
                ),
                ElevatedButton(
                  onPressed: () {
                    showSnackBar(context, "Create Hackathon");
                  },
                  child: Text("Create new hackacton"),
                ),
                Text("Hackathons",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
                createTable(organizationData.hackathons),
              ]),
        ),
      ),
    );
  }
}
