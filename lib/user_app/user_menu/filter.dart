import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:gigi_app/user_app/user_menu/rating.dart';

import '../../constant/size_constants.dart';

class filter_list extends StatefulWidget {
  const filter_list({Key? key}) : super(key: key);

  @override
  State<filter_list> createState() => _filter_listState();
}

class _filter_listState extends State<filter_list> {
  final List<String> items = ['High', 'Mid', 'Low'];
  String? selectedValue;
  RangeValues values = RangeValues(3, 20);
  RangeValues valuess = RangeValues(3, 20);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color(0xFFC0C0CF),
                thickness: 5,
                indent: 120,
                endIndent: 120,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Filters',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish'),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Set by Discount',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish')),
              SizedBox(
                height: 12,
              ),
              DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'High to Low',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_outlined,
                ),
                iconSize: 14,
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                buttonHeight: 50,
                buttonWidth: 160,
                buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.blue,
                ),
                buttonElevation: 2,
                itemHeight: 40,
                itemPadding: const EdgeInsets.only(left: 14, right: 14),
                dropdownMaxHeight: 200,
                dropdownWidth: 200,
                dropdownPadding: null,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.blue,
                ),
                dropdownElevation: 8,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Sort by Distance',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish')),
              SizedBox(
                height: 30,
              ),
              RangeSlider(
                values: values,
                onChanged: (RangeValues newRange) {
                  setState(() => values = newRange);
                },
                min: 3,
                max: 20,
                divisions: 5,
                labels: RangeLabels('${values.start}', '${values.end}'),
              ),
              SizedBox(
                height: 32,
              ),
              Text('Rating',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish')),
              SizedBox(
                height: 24,
              ),
              rating(),
              SizedBox(
                height: 20,
              ),
              Text('Price Range',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Mulish')),
              SizedBox(
                height: 30,
              ),
              RangeSlider(
                values: valuess,
                onChanged: (newRange) {
                  setState(() => valuess = newRange);
                },
                min: 3,
                max: 20,
                divisions: 5,
                labels: RangeLabels(
                  valuess.start.round().toString(),
                  valuess.end.round().toString(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(text: 'Submit', onPressed: () {}),
            ]),
      ),
    );
  }
}
