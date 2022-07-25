import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/deals_user.dart';


class C_slider extends StatefulWidget {
  const C_slider({Key? key}) : super(key: key);

  @override
  State<C_slider> createState() => _C_sliderState();
}

class _C_sliderState extends State<C_slider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    double carouselwidth = MediaQuery.of(context).size.width;
    double carouselheight = carouselwidth * 145 / 327;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CarouselSlider(
          items: [dealsUser(), dealsUser(), dealsUser()],
          options: CarouselOptions(
            aspectRatio: 2.0,
            height: carouselheight,

            // width: MediaQuery.of(context).size.width,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          )),
    );
  }
}
