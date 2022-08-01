import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constant/size_constants.dart';

class filter_list extends StatefulWidget {
  const filter_list({Key? key}) : super(key: key);

  @override
  State<filter_list> createState() => _filter_listState();
}

class _filter_listState extends State<filter_list> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    String? selectedValue;
    RangeValues values = RangeValues(10, 90);
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Divider(
          color: Color(0xFFC0C0CF),
          thickness: 5,
          indent: 120,
          endIndent: 120,
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
            border: Border.all(
              color: Colors.black26,
            ),
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
        RangeSlider(
          values: values,
          onChanged: (RangeValues newRange) {
            setState(() => values = newRange);
          },
          min: 0,
          max: 100,
          divisions: 20,
          labels: RangeLabels('${values.start}', '${values.end}'),
        ),
        RangeSlider(
          values: values,
          onChanged: (RangeValues newRange) {
            setState(() => values = newRange);
          },
          min: 0,
          max: 100,
          divisions: 20,
          labels: RangeLabels(
            values.start.round().toString(),
            values.end.round().toString(),
          ),
        ),
      ]),
    );
  }
}
