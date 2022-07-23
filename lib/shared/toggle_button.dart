import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Toggle_Button extends StatefulWidget {
  const Toggle_Button({Key? key}) : super(key: key);

  @override
  State<Toggle_Button> createState() => _Toggle_ButtonState();
}

class _Toggle_ButtonState extends State<Toggle_Button> {
  final List<bool> isSelected = List.generate(4, (_) => false);
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.vertical,
      color: Color(0xffA5A5BA),
      fillColor: Colors.blue,
      renderBorder: false,
      selectedColor: Colors.blue,
      children: <Widget>[
        Container(
          width: 100,
          color: Colors.white,
          // margin: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: const [Icon(Icons.circle), Text('Cash')],
          ),
        ),
        Text('ELECTRONICS'),
        Text('MENS'),
        Text('KIDS'),
      ],
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
        });
      },
      isSelected: isSelected,
    );
  }
}
