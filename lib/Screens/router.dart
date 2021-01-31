import 'package:medg/Screens/Forgotpass.dart';
import 'package:medg/Screens/UserScreens/BottomScreen/Reports.dart';
import 'package:medg/Screens/UserScreens/ReportUpdate.dart';
import 'file:///D:/Projects/medg/lib/Screens/UserScreens/ProfilePageView.dart';
import 'UserScreens/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:medg/Const/RoutesNames.dart';
import 'login.dart';
import 'Register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case ForgotViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ForgotView(),
      );
    case ProfilePageViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfileView(),

      );
    case ReportsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Reports(),


      );
    case ReportsUpdateRoute:
return _getPageRoute(
  routeName: settings.name,
  viewToShow: ReportUpdate(),
);
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName
      ),
      builder: (_) => viewToShow);
}