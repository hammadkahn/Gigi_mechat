import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gigi_app/user_app/user_menu/trending.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'deals_details.dart';

class all_details extends StatelessWidget {
  const all_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: trending_user(),
        onTap: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(26))),
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: Details_deals(),
              ),
            ));
  }
}
