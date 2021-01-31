import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:medg/Screens/UserScreens/ReportUpdate.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/ViewModels/HomeViewModel.dart';
import 'package:stacked/stacked.dart';
import '../../locator.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Looking For Title Here.......
  String title;
  AuthenticationService _authenticationService = locator<AuthenticationService>();
  assigner(){
    title = _authenticationService.currentUser.title!=null?_authenticationService.currentUser.title:'loading_title';
  }

  GlobalKey keyset = GlobalKey();
  @override
  Widget build(BuildContext context) {
    assigner();
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: ()=>HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body:model.pagination(model.Cind,title=="Student"?true:false),
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: Colors.deepPurple,
          tabs: [
            TabData( iconData: Icons.home, title: "Home"),
            title=='Student'?TabData(
                onclick: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>ReportUpdate()
                  ));
                }, iconData: Icons.library_books, title: "Reports"):TabData(onclick: () {}, iconData: Icons.supervised_user_circle, title: "Contact")
            ,TabData(
                onclick: () {}, iconData: Icons.person, title: "Profile")
          ],

          initialSelection: model.Cind,
        key: keyset,
          onTabChangedListener: (position) {
            model.setter(position);
          },
        ),
      ),
    );
  }
}
