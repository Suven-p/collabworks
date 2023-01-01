import 'package:collabworks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyMessagingScreen extends StatefulWidget {
  @override
  _MyMessagingScreenState createState() => _MyMessagingScreenState();
}

class _MyMessagingScreenState extends State<MyMessagingScreen> {
  String hackerName = "";
  void getData() {
    var data = _firestore
        .collection('hackers')
        .doc(firebaseAuth.currentUser?.uid ?? '')
        .get()
        .then((DocumentSnapshot snapshot) {
      hackerName = snapshot.get('name');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final _firestore = firestore;
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: _firestore
                    .collection('teams')
                    .doc('MLH TEAM')
                    .collection('messages')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final messages = snapshot.data!.docs.reversed;
                  List<Widget> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message['text'];
                    final messageSender = message['sender'];

                    final messageWidget = Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$messageText from $messageSender',
                      ),
                    );

                    messageWidgets.add(messageWidget);
                  }
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: ListView(
                      reverse: true,
                      children: messageWidgets,
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Enter your message...',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _firestore
                            .collection('teams')
                            .doc('MLH TEAM')
                            .collection('messages')
                            .add({
                          'text': _textController.text,
                          'sender': hackerName,
                        });
                        _textController.clear();
                      },
                      child: Text(
                        'Send',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
