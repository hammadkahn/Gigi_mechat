import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/chat/message_box.dart';
import 'package:gigi_app/chat/message_write.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Column(
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
                              child:
                                  Image.asset('assets/images/arrow-left.png')),
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
                  const MessageItem(
                    send: false,
                    message:
                        'I commented on Figma, I want to add some fancy icons. Do you have any icon set?',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const MessageItem(
                    send: true,
                    message:
                        'I am in a process of designing some. When do you need them?',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const MessageItem(
                    send: false,
                    message: 'Next month?',
                  ),
                  const Text('08:12',
                      style: TextStyle(
                          fontFamily: 'Mulish',
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 10,
                  ),
                  const MessageItem(
                    send: true,
                    message:
                        'I am almost finish. Please give me your email, I will ZIP them and send you as son as im finish.',
                  ),
                  // Message_write()
                ],
              ),
            )));
  }
}
