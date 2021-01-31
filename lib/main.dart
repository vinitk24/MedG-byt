import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/router.dart';
import 'Screens/startupLogic.dart';
import 'Services/DialogService.dart';
import 'Services/Navigator_services.dart';
import 'locator.dart';
import 'package:medg/Manager/Dialog_manager.dart';



void main() async{
  Setuplocator();
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'opensans'
      ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Navigator(
          key: locator<DialogService>().dialogNavigationKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => DialogManager(child: child)),
        ),
        navigatorKey: locator<Navigation_Services>().navigationkey,
home:StartupLogic(),
        onGenerateRoute: generateRoute,
      );
  }
}

