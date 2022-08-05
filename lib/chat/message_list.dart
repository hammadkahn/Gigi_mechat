import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gigi_app/chat/message_box.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../apis/api_urls.dart';
import '../providers/chat_provider.dart';

class Message extends StatefulWidget {
  const Message({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final msgCtr = TextEditingController();
  PusherChannel? myChannel;
  bool isChatStart = false;

  void onConnectPressed() async {
    try {
      pusher.init(
        apiKey: '814fe1b741785e7ace5e',
        cluster: 'ap2',
        onAuthorizer: onAuthorizer,
      );
      myChannel =
          await pusher.subscribe(channelName: 'private-messages-channel.${19}');
      await pusher.connect();

      setState(() {
        isChatStart = true;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    debugPrint('$channelName, $socketId, $options');

    var authUrl = '${ApiUrls.baseUrl}channelAuthorization';
    var result = await post(
      Uri.parse(authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        HttpHeaders.authorizationHeader: 'Bearer ${widget.token}',
      },
      body: 'socket_id=$socketId&channel_name=$channelName',
    );

    log('response : ${result.body}');

    return jsonDecode(result.body);
  }

  void onTriggerEventPressed(String msg, String eventName) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("eventName", _eventName.text);
    // prefs.setString("data", _data.text);

    pusher.trigger(PusherEvent(
      channelName: myChannel!.channelName,
      eventName: 'client-$eventName',
      data: msg,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: isChatStart == false
                  ? Center(
                      child: TextButton(
                        child: const Text('Start Chat'),
                        onPressed: () {
                          onConnectPressed();
                          print(myChannel);
                        },
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white,
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        'assets/images/arrow-left.png')),
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                  child: Text('G.Mamedoff',
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text('1 FEB 12:00',
                            style: TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<Map<String, dynamic>>(
                            future: Provider.of<ChatProvider>(context,
                                    listen: false)
                                .getSingleConversation(widget.token, '4'),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Center(
                                      child: CircularProgressIndicator());
                                default:
                                  if (snapshot.hasError || !snapshot.hasData) {
                                    return Center(
                                      child: Text(
                                          '${snapshot.error ?? 'No data available'}'),
                                    );
                                  } else {
                                    return Expanded(
                                      child: ListView.builder(
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return MessageItem(
                                            send: int.parse(
                                                        snapshot.data!['data']
                                                            ['firstUser']) ==
                                                    4
                                                ? true
                                                : false,
                                            message: 'hello world',
                                          );
                                        },
                                      ),
                                    );
                                  }
                              }
                            }),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: Container(
                            color: const Color(0xFF444253),
                            height: 74,
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, right: 16),
                                  child: Container(
                                    height: 48,
                                    width: 45.28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color(0xFF323041),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.grey[300],
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFF323041),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 10,
                                        ),
                                        hintText: 'Aa',
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      autofocus: false,
                                      style: const TextStyle(
                                        color: Color(0xffB0B0B0),
                                      ),
                                      cursorWidth: 1,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    onTriggerEventPressed(
                                        msgCtr.text, 'eventName');
                                    msgCtr.clear();
                                  },
                                  icon: Icon(
                                    Icons.send,
                                    //color: Colors.grey[300],
                                    color: const Color(0xFFB0B0B0)
                                        .withOpacity(0.8),
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            )));
  }
}
