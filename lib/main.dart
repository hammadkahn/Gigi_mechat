import 'package:flutter/material.dart';
import 'package:gigi_app/screens/onboarding/onboard.dart';

import 'constant/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: onBoard(),
    );
  }
}
