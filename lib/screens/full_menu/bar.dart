import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/screens/QR/qr.dart';
import 'package:gigi_app/screens/full_menu/chat.dart';
import 'package:gigi_app/screens/full_menu/contact.dart';
import 'package:gigi_app/screens/full_menu/menu.dart';
import 'package:gigi_app/screens/full_menu/profile.dart';

class Bar extends StatefulWidget {
  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  int currentIndex = 0;

  final List<Widget> _children = [
    Menu(),
    Contact_us(),
    QR(),
    Chat(),
    Profile(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = Menu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => QR()));
          },
          child: Image.asset(
            'assets/images/auth_pic.png',
            width: 31,
            height: 31,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: Color(0xFF030381),
            shape: CircularNotchedRectangle(),
            notchMargin: 0,
            child: Container(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 24,
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                          currentScreen = Menu();
                        });
                      },
                      child: Image.asset(
                        'assets/images/home.png',
                        width: 24,
                        height: 24,
                        color: currentIndex == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 24,
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                          currentScreen = Contact_us();
                        });
                      },
                      child: Image.asset(
                        'assets/images/contact.png',
                        width: 24,
                        height: 24,
                        color: currentIndex == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 24,
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                          currentScreen = Chat();
                        });
                      },
                      child: Image.asset(
                        'assets/images/chat.png',
                        width: 24,
                        height: 24,
                        color: currentIndex == 2 ? Colors.black : Colors.white,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 24,
                      onPressed: () {
                        setState(() {
                          currentIndex = 3;
                          currentScreen = Profile();
                        });
                      },
                      child: Image.asset(
                        'assets/images/profile.png',
                        width: 24,
                        height: 24,
                        color: currentIndex == 3 ? Colors.black : Colors.white,
                      ),
                    )
                  ],
                ))));
  }
}
