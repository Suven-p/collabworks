import 'package:sendgrid_mailer/sendgrid_mailer.dart';

void sendMessage(String username, String address) async {
  final mailer = Mailer('<<YOUR_API_KEY>>');
  final toAddress = Address(address);
  final fromAddress = Address('donotreply@collabworks.com');
  final subject = 'Welcome To Collabworks!';
  final personalization = Personalization([toAddress]);
  final email = Email([personalization], fromAddress, subject,
      templateId: "d-b76987e2268f4a6bb31f352165eb316d",
      headers: {
        "iconHeight": "23",
        "siteUrl": "https://collabsworks.co",
        "iconUrl": "",
        "username": username,
        "verifyUrl": 'http://collabsworks.co/verify/$username'
      });
  mailer.send(email).then((result) {
    print("Result: $result");
  });
}
