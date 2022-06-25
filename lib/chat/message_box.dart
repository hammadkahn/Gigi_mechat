import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageItem extends StatelessWidget {
  final bool send;
  final String message;

  const MessageItem({Key? key, required this.send, required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13, left: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            send ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: !send,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/man1.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                left: !send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
                right: send ? 5 : (MediaQuery.of(context).size.width / 2) - 80,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(send ? 20 : 0),
                  bottomRight: Radius.circular(send ? 0 : 20),
                ),
                color: send
                    ? Color(0xff0D9BFF)
                    : Color(0xFFE9E9E9).withOpacity(0.8),
              ),
              child: SelectableText(
                message,
                style: TextStyle(
                    color: send ? Colors.white : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mulish'),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Visibility(
            visible: send,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/man2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
