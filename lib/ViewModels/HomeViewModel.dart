
import 'package:medg/Screens/UserScreens/BottomScreen/Connection.dart';
import 'package:medg/Screens/UserScreens/BottomScreen/Reports.dart';
import 'package:medg/Screens/UserScreens/HomeViewBody.dart';
import 'package:medg/Screens/UserScreens/ProfilePageView.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/Navigator_services.dart';
import '../locator.dart';
import 'BaseModel.dart';
class HomeViewModel extends BaseModel{

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  Navigation_Services _navigation_services = locator<Navigation_Services>();
  List<String> pages = ['Home','Connections','Reports','Settings'];

  int _currentIndex= 0;
  get Cind =>_currentIndex;

  setter(int ind) {
    _currentIndex = ind;
    print(_currentIndex);
    notifyListeners();
  }

  pagination(int ind,bool isStudent){
    switch(ind){
      case 0:
        return HomeViewBody();
      case 1:
        return isStudent?Reports():Connnections();
      case 2:
        return ProfileView();
    }
    notifyListeners();
  }



}