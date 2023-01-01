import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final String sender;
  const MessageWidget({Key? key, required this.message, required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container();
  }
}
