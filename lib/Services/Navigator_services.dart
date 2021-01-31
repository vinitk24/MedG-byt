import 'package:flutter/cupertino.dart';

class Navigation_Services {
  GlobalKey<NavigatorState> _navigationkey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationkey => _navigationkey;

  void pop() {
    return _navigationkey.currentState.pop();
  }

  Future<dynamic> navigateTo(String Routename, {dynamic argument}) {
    return _navigationkey.currentState
        .pushNamed(Routename, arguments: argument);
  }

  Future<dynamic> replacednavigateTo(String Routename, {dynamic argument}) {
    return _navigationkey.currentState
        .pushReplacementNamed(Routename, arguments: argument);
  }
}
