import 'package:flutter/material.dart';
import 'package:gigi_app/chat/chat_screen.dart';
import 'package:gigi_app/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false)
        .getAllConversation(token);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: FutureBuilder<Conversation>(
          future: chatProvider,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: ((context, index) {
                      var data = snapshot.data!.data!;
                      // setState(() {
                      //   name = data[index].oppositeUser!.name;
                      // });
                      return ListTile(
                        onTap: () {
                          // onConnectPressed(userId!);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ChatScreen(
                                    token: token,
                                    conversationId: snapshot
                                        .data!.data![index].id
                                        .toString(),
                                  )));
                        },
                        title: Text(data[index].oppositeUser!.name!),
                        leading: const Icon(Icons.person, size: 20),
                      );
                    }),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
