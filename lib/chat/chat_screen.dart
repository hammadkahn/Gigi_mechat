import 'package:flutter/material.dart';
import 'package:gigi_app/chat/message_write.dart';
import 'package:gigi_app/providers/chat_provider.dart';

import 'message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key, required this.chatData, required this.token})
      : super(key: key);
  final Conversation chatData;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(chatData.data![0].oppositeUser!.name!)),
      body: Column(children: [
        Expanded(
            flex: 6,
            child: ListView.builder(
              itemCount: chatData.data!.length,
              itemBuilder: ((context, index) {
                return MessageItem(
                  message: chatData.data![index].lastMessage!.message!,
                  send: false,
                );
              }),
            )),
        Expanded(
          flex: 1,
          child: Message_write(
              token: token, id: chatData.data![0].oppositeUser!.id.toString()),
        )
      ]),
    );
  }
}
