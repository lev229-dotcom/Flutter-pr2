import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

const String log = 'log';
const String reg = 'reg';
const String adminpage = 'adminpage';
const String userpage = 'userpage';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case log:
        {
          return MaterialPageRoute(builder: (_) => Login());
        }
      case reg:
        {
          return MaterialPageRoute(builder: (_) => Registration());
        }
      case adminpage:
        {
          return MaterialPageRoute(builder: (_) => MainPage());
        }
      case userpage:
        {
          return MaterialPageRoute(builder: (_) => UserPage());
        }
    }
  }
}
