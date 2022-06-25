import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/screens/QR/qr.dart';
import 'package:gigi_app/screens/full_menu/bar.dart';
import 'package:gigi_app/screens/full_menu/location_bar.dart';
import 'package:gigi_app/shared/custom_button.dart';

import '../../constant/size_constants.dart';
import 'deals.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                location_bar(),
                Deals(),
                Deals(),
                Deals(),
                Deals(),
                Deals()
              ],
            ),
          ),
        ));
  }
}
