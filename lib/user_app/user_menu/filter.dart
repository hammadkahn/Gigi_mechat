import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gigi_app/providers/deal_provider.dart';
import 'package:gigi_app/shared/custom_button.dart';
import 'package:provider/provider.dart';

class filter_list extends StatefulWidget {
  const filter_list({Key? key}) : super(key: key);

  @override
  State<filter_list> createState() => _filter_listState();
}

class _filter_listState extends State<filter_list> {
  DealProvider? dealProvider;
  final List<String> items = ['asc', 'desc'];
  String? selectedValue;
  RangeValues values = const RangeValues(3, 20);
  RangeValues valuess = const RangeValues(0, 100);

  @override
  void initState() {
    super.initState();
    dealProvider = Provider.of<DealProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Color(0xFFC0C0CF),
              thickness: 5,
              indent: 120,
              endIndent: 120,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Filters',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish'),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Price Order',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish')),
            const SizedBox(
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
                      'asc',
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
                  dealProvider!.setDiscount(value);
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
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Discount Range',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Mulish')),
            const SizedBox(
              height: 30,
            ),
            RangeSlider(
              values: valuess,
              onChanged: (newRange) {
                setState(() => valuess = newRange);
              },
              min: 0,
              max: 100,
              divisions: 5,
              labels: RangeLabels(
                valuess.start.round().toString(),
                valuess.end.round().toString(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                text: 'Submit',
                onPressed: () {
                  dealProvider!.setPriceRange(valuess);
                  Navigator.of(context).pop();
                }),
            const SizedBox(
              height: 20,
            ),
          ]),
    );
  }
}
