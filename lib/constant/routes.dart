import 'package:flutter/material.dart';
import '../screens/authentication/auth.dart';

final Map<String, WidgetBuilder> routes = {
  auth_page.routeName: (context) => auth_page()
};
