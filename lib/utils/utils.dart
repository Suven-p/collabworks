//variables
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

var firestore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;
var firebaseAuth = FirebaseAuth.instance;

//utils

File? image;
bool hasTeam = false;
bool joinedHackathon = false;
bool submittedProject = false;

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
