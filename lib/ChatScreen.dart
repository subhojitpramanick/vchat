import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// Additional widgets for chat messages can be added her
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            CircleAvatar(
              child: Text('OR'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Olivia Rodrigo',
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            )
          ],
        )),
        body: Column(
          children: [
            //Message List Code
            Expanded(
                child: ListView.builder(
              reverse: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                bool isSentByMe = index % 2 == 0;
                return Align(
                    alignment: isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: isSentByMe ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          isSentByMe ? 'message from me' : 'message from you',
                          style: TextStyle(
                            color: isSentByMe ? Colors.white : Colors.black,
                          ),
                        )));
              },
            )),
            //input Field
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.grey[200],
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'type a message..',
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                ],
              ),
            )
          ],
        ));
  }
}
