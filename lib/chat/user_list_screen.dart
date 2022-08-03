import 'package:flutter/material.dart';
import 'package:gigi_app/chat/chat_screen.dart';
import 'package:gigi_app/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  // PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  // String? name;
  // final _apiKey = TextEditingController();
  // final _cluster = TextEditingController();
  // final _channelName = TextEditingController();
  // final _eventName = TextEditingController();
  // final _channelFormKey = GlobalKey<FormState>();
  // final _eventFormKey = GlobalKey<FormState>();
  // final _listViewController = ScrollController();
  // final _data = TextEditingController();
  // PusherChannel? myChannel;

  // void onConnectPressed() async {
  //   if (!_channelFormKey.currentState!.validate()) {
  //     return;
  //   }
  //   // Remove keyboard
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("apiKey", _apiKey.text);
  //   prefs.setString("cluster", _cluster.text);
  //   prefs.setString("channelName", _channelName.text);

  //   try {
  //     await pusher.init(
  //       apiKey: '814fe1b741785e7ace5e',
  //       cluster: 'ap2',
  //       onConnectionStateChange: onConnectionStateChange,
  //       onError: onError,
  //       onSubscriptionSucceeded: onSubscriptionSucceeded,
  //       onEvent: onEvent,
  //       onSubscriptionError: onSubscriptionError,
  //       onDecryptionFailure: onDecryptionFailure,
  //       onMemberAdded: onMemberAdded,
  //       onMemberRemoved: onMemberRemoved,
  //       // authEndpoint:
  //       //     "https://gigiapi.zanforthstaging.com/api/channelAuthorization",
  //       onAuthorizer: onAuthorizer,
  //     );
  //     myChannel = await pusher.subscribe(
  //         channelName: 'private-messages-channels.$name');
  //     debugPrint(myChannel!.channelName);
  //     await pusher.connect();
  //   } catch (e) {
  //     log("ERROR: $e");
  //   }
  // }

  // void onConnectionStateChange(dynamic currentState, dynamic previousState) {
  //   log("Connection: $currentState");
  // }

  // void onError(String message, int? code, dynamic e) {
  //   log("onError: $message code: $code exception: $e");
  // }

  // void onEvent(PusherEvent event) {
  //   debugPrint(event.data);
  //   debugPrint(event.eventName);
  //   debugPrint(event.channelName);
  //   log("onEvent: $event");
  // }

  // void onSubscriptionSucceeded(String channelName, dynamic data) {
  //   log("onSubscriptionSucceeded: $channelName data: $data");
  //   final me = myChannel!.channelName;
  //   log("Me: $me");
  // }

  // void onSubscriptionError(String message, dynamic e) {
  //   log("onSubscriptionError: $message Exception: $e");
  // }

  // void onDecryptionFailure(String event, String reason) {
  //   log("onDecryptionFailure: $event reason: $reason");
  // }

  // void onMemberAdded(String channelName, PusherMember member) {
  //   log("onMemberAdded: $channelName user: $member");
  // }

  // void onMemberRemoved(String channelName, PusherMember member) {
  //   log("onMemberRemoved: $channelName user: $member");
  // }

  // dynamic onAuthorizer(
  //     String channelName, String socketId, dynamic options) async {
  //   debugPrint('$channelName, $socketId, $options');

  //   var authUrl = '${ApiUrls.baseUrl}channelAuthorization';
  //   var result = await post(
  //     Uri.parse(authUrl),
  //     headers: {
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //       'Authorization': 'Bearer ${widget.token}',
  //     },
  //     body: 'socket_id=$socketId&channel_name=$channelName',
  //   );

  //   log('response : ${result.body}');

  //   return jsonDecode(result.body);
  //   // debugPrint('type :${options.runtimeType}');
  //   // return {
  //   //   "auth": "foo:bar",
  //   //   "channel_data": '{"user_id": 2}}',
  //   //   "shared_secret": "foobar"
  //   // };
  // }

  // void onTriggerEventPressed() async {
  //   var eventFormValidated = _eventFormKey.currentState!.validate();

  //   if (!eventFormValidated) {
  //     return;
  //   }
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("eventName", _eventName.text);
  //   prefs.setString("data", _data.text);
  //   debugPrint(_channelName.text);
  //   pusher.trigger(PusherEvent(
  //     channelName: myChannel!.channelName,
  //     eventName: _eventName.text,
  //     data: _data.text,
  //   ));
  // }

  // // Platform messages are asynchronous, so we initialize in an async method.
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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initPlatformState();
  // }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false)
        .getAllConversation(widget.token);
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
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ChatScreen(
                                      token: widget.token,
                                      chatData: snapshot.data!,
                                    ))),
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
