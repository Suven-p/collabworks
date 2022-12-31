import "package:flutter/material.dart";
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:flutter/cupertino.dart';

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

class OrganizationManagement extends StatelessWidget {
  OrganizationManagement({Key? key}) : super(key: key);
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
    return MainScaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(),
      child: Container(
          child: Column(
        children: [Image.network(organizationData.image)],
      )),
    );
  }
}
