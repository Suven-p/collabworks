import "package:flutter/material.dart";
import 'package:collabworks/screens/mainScaffold.dart';
import 'package:flutter/cupertino.dart';

class OrganizationManagement extends StatelessWidget {
  const OrganizationManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: Container(), drawer: DefaultDrawer(), appBar: DefaultAppBar());
  }
}
