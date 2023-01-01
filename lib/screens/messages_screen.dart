import 'package:collabworks/screens/mainScaffold.dart';
import 'package:collabworks/ui/message_widget.dart';
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
      drawer: DefaultDrawer(),
      backgroundColor: Color(0xFF232946),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: DefaultAppBar(),
      ),
      body: Column(
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

                final messages = snapshot.data!.docs;
                List<Widget> messageWidgets = [];
                for (var message in messages) {
                  final messageText = message['text'];
                  final messageSender = message['sender'];

                  final messageWidget = MessageWidget(
                    message: messageText,
                    sender: 'Armaan',
                  );

                  messageWidgets.add(messageWidget);
                }
                return ListView(
                  reverse: true,
                  children: messageWidgets,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFb8c1ec),
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
                        style: TextStyle(
                          color: Colors.black,
                        ),
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
          ),
        ],
      ),
    );
  }
}
