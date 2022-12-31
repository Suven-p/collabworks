import 'package:collabworks/models/hacker_model.dart';
import 'package:collabworks/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthController {
  //void signUp

  void signUp(HackerModel model, BuildContext context) {
    AuthRepository().registerHacker(model, context);
  }
}
