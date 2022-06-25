import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Message_write extends StatelessWidget {
  const Message_write({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Container(
          color: Color(0xFF444253),
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
                    color: Color(0xFF323041),
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
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    filled: true,
                    fillColor: Color(0xFF323041),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    hintText: 'Aa',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  autofocus: false,
                  style: TextStyle(
                    color: Color(0xffB0B0B0),
                  ),
                  cursorWidth: 1,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  //color: Colors.grey[300],
                  color: Color(0xFFB0B0B0).withOpacity(0.8),
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
