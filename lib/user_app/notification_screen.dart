import 'package:flutter/material.dart';
import 'package:gigi_app/models/notification.dart';
import 'package:gigi_app/services/notification_services.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: FutureBuilder<NotificationModel>(
          future: NotificationServices().getNotifications(token: token),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.data!.data!.isEmpty) {
                  return const Center(child: Text('No deals available'));
                } else {
                  print(snapshot.data!.data!.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.data![index];
                      return InkWell(
                          hoverColor: Colors.lightBlue,
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              iconColor: Colors.white,
                              contentPadding: const EdgeInsets.all(10),
                              textColor: Colors.white,
                              tileColor: Color(0xFF030381),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              leading: Icon(Icons.notifications),
                              title: Text(data.subject!),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.message!),
                                  Text(data.type!),
                                  Text(data.seen == '0' ? 'Not seen' : 'Seen'),
                                  const Divider(
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
