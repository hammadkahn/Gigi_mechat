import 'package:flutter/material.dart';
import 'package:gigi_app/user_app/categories/categories.dart';
import 'package:gigi_app/user_app/user_menu/cart_user.dart';
import 'package:gigi_app/user_app/user_menu/discont_user.dart';
import 'package:gigi_app/user_app/user_menu/fav_user.dart';
import 'package:gigi_app/user_app/user_menu/full_user_meu.dart';

class User_bar extends StatefulWidget {
  const User_bar({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<User_bar> createState() => _User_barState();
}

class _User_barState extends State<User_bar> {
  int currentIndex = 0;

  List<Widget> _children = [];

  final PageStorageBucket bucket = PageStorageBucket();

  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = Full_menu_user(token: widget.token);
    _children = [
      Full_menu_user(
        token: widget.token,
      ),
      Categories_user(
        token: widget.token,
      ),
      const Discount_user(),
      const Fav_user(),
      const Cart_user(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(bucket: bucket, child: currentScreen),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Categories_user(token: widget.token),
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
            color: const Color(0xFF030381),
            shape: const CircularNotchedRectangle(),
            notchMargin: 0,
            child: SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 24,
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                          currentScreen = Full_menu_user(token: widget.token);
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
                          currentScreen = Categories_user(
                            token: widget.token,
                          );
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
                          currentScreen = const Fav_user();
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
                          currentScreen = const Cart_user();
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
