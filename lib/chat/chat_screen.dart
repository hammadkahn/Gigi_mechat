import 'package:flutter/material.dart';
import 'package:gigi_app/providers/chat_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/current_user_chat_model.dart';
import 'message_box.dart';
import 'message_write.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.conversationId,
    required this.token,
  }) : super(key: key);
  final String conversationId;
  final String token;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? userId;

  Future<void> getCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId').toString();
    });
  }

  @override
  void initState() {
    getCurrentUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: const Color(0xFF030381),
      ),
      body: userId == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        flex: 6,
                        child: FutureBuilder<CurrentUserConversation>(
                          future: Provider.of<ChatProvider>(context)
                              .getCurrentConversation(
                                  widget.token, widget.conversationId),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.data == null) {
                                return const Center(
                                    child: Text('Empty, No Messages found'));
                              } else {
                                return ListView.builder(
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: ((context, index) {
                                    return MessageItem(
                                      message:
                                          snapshot.data!.data![index].message!,
                                      send:
                                          snapshot.data!.data![index].userId ==
                                                  userId
                                              ? true
                                              : false,
                                    );
                                  }),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )),
                    Expanded(
                      flex: 1,
                      child: Message_write(
                          token: widget.token, id: widget.conversationId),
                    )
                  ]),
            ),
    );
  }
}
