import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/categories/categories.dart';
import 'package:gigi_app/user_app/user_menu/cart_user.dart';
import 'package:gigi_app/user_app/user_menu/discont_user.dart';
import 'package:gigi_app/user_app/user_menu/fav_user.dart';
import 'package:gigi_app/user_app/user_menu/full_user_meu.dart';

class User_bar extends StatefulWidget {
  const User_bar({Key? key}) : super(key: key);

  @override
  State<User_bar> createState() => _User_barState();
}

class _User_barState extends State<User_bar> {
  int currentIndex = 0;

  final List<Widget> _children = [
    Full_menu_user(),
    Categories_user(),
    Discount_user(),
    Fav_user(),
    Cart_user(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = Full_menu_user();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Categories_user(),
            ));
          },
          child: Image.asset(
            'assets/images/voucher.png',
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
                          currentScreen = Discount_user();
                        });
                      },
                      child: Image.asset(
                        'assets/images/gigi-logo.png',
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
                          currentScreen = Categories_user();
                        });
                      },
                      child: Image.asset(
                        'assets/images/category.png',
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
                          currentScreen = Fav_user();
                        });
                      },
                      child: Image.asset(
                        'assets/images/fav.png',
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
                          currentScreen = Cart_user();
                        });
                      },
                      child: Image.asset(
                        'assets/images/cart.png',
                        width: 24,
                        height: 24,
                        color: currentIndex == 3 ? Colors.black : Colors.white,
                      ),
                    )
                  ],
                ))));
  }
}
