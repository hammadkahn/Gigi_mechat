import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class rating extends StatefulWidget {
  const rating({Key? key}) : super(key: key);

  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  List<String> options = [
    '1',
    '2',
    '3',
    '4',
    '5 ',
  ];

  List<String> tags = [];
  @override
  Widget build(BuildContext context) {
    return ChipsChoice<String>.multiple(
      value: tags,
      onChanged: (val) => {setState(() => tags = val)},
      choiceItems: C2Choice.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      choiceStyle: C2ChoiceStyle(
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Mulish',
        ),
        backgroundColor: Colors.white,
        color: Colors.black,
        borderColor: Colors.grey,
      ),
      wrapped: true,
      textDirection: TextDirection.rtl,
    );
  }
}

class Content extends StatefulWidget {
  final String? title;
  final Widget? child;

  Content({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content>
    with AutomaticKeepAliveClientMixin<Content> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.black,
            child: Text(
              widget.title!,
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w500),
            ),
          ),
          Flexible(fit: FlexFit.loose, child: widget.child!),
        ],
      ),
    );
  }
}
