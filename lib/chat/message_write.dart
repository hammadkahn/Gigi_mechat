import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gigi_app/providers/chat_provider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/api_urls.dart';

class Message_write extends StatefulWidget {
  const Message_write({Key? key, required this.token, required this.id})
      : super(key: key);
  final String token;
  final String id;

  @override
  State<Message_write> createState() => _Message_writeState();
}

class _Message_writeState extends State<Message_write> {
  final msgController = TextEditingController();

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  // final _apiKey = TextEditingController();
  // final _cluster = TextEditingController();
  // final _channelName = TextEditingController();
  // final _eventName = TextEditingController();
  final _channelFormKey = GlobalKey<FormState>();
  final _eventFormKey = GlobalKey<FormState>();
  // final _listViewController = ScrollController();
  // final _data = TextEditingController();
  PusherChannel? myChannel;

  void onConnectPressed() async {
    // Remove keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("apiKey", _apiKey.text);
    // prefs.setString("cluster", _cluster.text);
    // prefs.setString("channelName", _channelName.text);

    try {
      await pusher.init(
        apiKey: '814fe1b741785e7ace5e',
        cluster: 'ap2',
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // authEndpoint:
        //     "https://gigiapi.zanforthstaging.com/api/channelAuthorization",
        onAuthorizer: onAuthorizer,
      );
      myChannel = await pusher.subscribe(
          channelName: 'private-messages-channel.${widget.id}');
      debugPrint(myChannel!.channelName);
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    debugPrint(event.data);
    debugPrint(event.eventName);
    debugPrint(event.channelName);
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = myChannel!.channelName;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    debugPrint('$channelName, $socketId, $options');
    String? token = '406|hbqJi8vdmeY2Us8VhxKdyXnPhJl2xG2JO8x2mMDB';

    var authUrl = '${ApiUrls.baseUrl}channelAuthorization';
    var result = await post(
      Uri.parse(authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${widget.token}',
      },
      body: 'socket_id=$socketId&channel_name=$channelName',
    );

    log('response : ${result.body}');

    return jsonDecode(result.body);
    // debugPrint('type :${options.runtimeType}');
    // return {
    //   "auth": "foo:bar",
    //   "channel_data": '{"user_id": 2}}',
    //   "shared_secret": "foobar"
    // };
  }

  void onTriggerEventPressed() async {
    var eventFormValidated = _eventFormKey.currentState!.validate();

    if (!eventFormValidated) {
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("eventName", 'messaging sending');
    prefs.setString("data", msgController.text);
    debugPrint(myChannel!.channelName);
    pusher.trigger(PusherEvent(
      channelName: myChannel!.channelName,
      eventName: 'messaging sending',
      data: msgController.text,
    ));
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initPlatformState() async {
  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   _apiKey.text = prefs.getString("apiKey") ?? '';
  //   //   _cluster.text = prefs.getString("cluster") ?? 'eu';
  //   //   _channelName.text = prefs.getString("channelName") ?? 'my-channel';
  //   //   _eventName.text = prefs.getString("eventName") ?? 'client-event';
  //   //   _data.text = prefs.getString("data") ?? 'test';
  //   // });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onConnectPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          color: const Color(0xFF444253),
          // color: Color(0xFF444253),
          height: 74,
          // decoration: BoxDecoration(
          //   border: Border(
          //     top: BorderSide(color: Colors.amber, width: 0.5),
          //   ),
          // ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 16),
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
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF323041),
                      contentPadding: const EdgeInsets.symmetric(
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
                  onTriggerEventPressed();
                  Provider.of<ChatProvider>(context, listen: false).sendMessage(
                    widget.token,
                    msgController.text,
                    widget.id,
                  );
                },
                icon: Icon(
                  Icons.send,
                  //color: Colors.grey[300],
                  color: const Color(0xFFB0B0B0).withOpacity(0.8),
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
