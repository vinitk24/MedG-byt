import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Services/Navigator_services.dart';

import '../locator.dart';

class PushNotifications{


  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final Navigation_Services _navigation_services = locator<Navigation_Services>();


  Future inittilize() async {

    _firebaseMessaging.configure(
       onMessage:(Map<String,dynamic> message)
       async{
         print("onMessage:$message");
       },
      onLaunch:(Map<String,dynamic> message)
      async{
        print("onLaunch:$message");
        Navigator(message);
      },onResume:(Map<String,dynamic> message)
    async{
      print("onResume:$message");
      Navigator(message);
    },
    );



  }


  void Navigator(Map<String,dynamic> message){
    var notificationData = message["data"];
    var view = notificationData["view"];
    if(view!=null){
      if(view=="reportupdate"){
          _navigation_services.navigateTo(ReportsUpdateRoute);
      }
    }
  }


}