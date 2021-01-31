import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/Navigator_services.dart';
import 'package:medg/Services/Push_Notification.dart';
import 'package:medg/locator.dart';

import 'BaseModel.dart';

class StartupLogicModel extends BaseModel{

AuthenticationService _authenticationService = locator<AuthenticationService>();
Navigation_Services _navigation_services = locator<Navigation_Services>();
PushNotifications _pushNotifications = locator<PushNotifications>();



isUserloggedin()async{

  var hasUserLoggedin = await _authenticationService.isUserLoggedin();
  await _pushNotifications.inittilize();
  if(hasUserLoggedin){
    await Future.delayed(Duration(seconds: 3));
    _navigation_services.replacednavigateTo(HomeViewRoute);

  }else{
    await Future.delayed(Duration(seconds: 3));
    _navigation_services.replacednavigateTo(LoginViewRoute);
  }

}

}