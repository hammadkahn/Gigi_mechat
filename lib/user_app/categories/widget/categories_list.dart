import 'package:flutter/material.dart';
import 'package:gigi_app/models/category_model.dart';

class AllCategoriesWidget extends StatelessWidget {
  const AllCategoriesWidget(
      {Key? key,
      required this.length,
      required this.direction,
      required this.categoryList})
      : super(key: key);
  final int length;
  final Axis direction;
  final List<CategoryData> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: ((context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categoryList[index].name!,
                style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF32324D))),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Color(0xFFE6E6E6),
              thickness: 1,
            ),
          ],
        );
      }),
    );
  }
}
