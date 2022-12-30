import 'package:collabworks/models/hacker_model.dart';
import 'package:collabworks/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository {
  //function to register the hacker

  void validate(HackerModel model, BuildContext context) async {
    if (model.name.length <= 3) {
      showSnackBar(context, 'The name must be of 3 characters atleast!');
    } else if (!model.email.toString().contains("@")) {
      showSnackBar(context, 'Invalid email address!');
    } else if (int.parse(model.age) < 12 || int.parse(model.age) > 60) {
      showSnackBar(context, 'Invalid age!');
    } else if (model.phoneNumber.length != 10) {
      showSnackBar(context, 'Invalid phone number');
    } else {
      //create account here
      firebaseAuth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);

      //put the image in the storage

      Reference reference =
          firebaseStorage.ref('profilePictures/${model.name}');
      UploadTask uploadTask = reference.putFile(image!);
      final storageSnapshot = uploadTask.snapshot;
      final downloadUrl = await storageSnapshot.ref.getDownloadURL();

      firestore
          .collection('hackers')
          .doc(firebaseAuth.currentUser?.uid ?? '')
          .set(model.toMap());
    }
  }

  void registerHacker(
      HackerModel model, BuildContext context, String validationType) async {
    //use firebase

    String verify = "";

    if (validationType == "email") {
      validate(model, context);
    } else if (validationType == "phone") {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: '${"+91" + ""}',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseException e) {},
          timeout: const Duration(seconds: 120),
          codeSent: (String verificationId, int? resendToken) {
            verify = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: "", smsCode: "");
    } else {}
  }
}
