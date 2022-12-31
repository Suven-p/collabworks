import 'package:collabworks/models/hackathon_model.dart';
import 'package:collabworks/models/hacker_model.dart';
import 'package:collabworks/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import '../models/organization_model.dart';

class AuthController {
  //void signUp

  void signUp(HackerModel model, BuildContext context) {
    AuthRepository().registerHacker(model, context);
  }

  void logIn(String email, String pass, BuildContext context) {
    AuthRepository().loginHacker(pass, email, context);
  }

  void registerOrganization(OrganizationModel model, BuildContext context) {
    AuthRepository().registerOrganization(model, context);
  }

  void loginOrganization(String pass, String email, BuildContext context) {
    AuthRepository().loginOrganization(pass, email, context);
  }

  void createHackathon(HackathonModel model, BuildContext context) {
    AuthRepository().addHackathon(model, context);
  }
}
