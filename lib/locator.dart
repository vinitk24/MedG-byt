import 'package:get_it/get_it.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/FirestoreService.dart';
import 'package:medg/Services/Navigator_services.dart';
import 'package:medg/Services/Push_Notification.dart';

import 'Services/DialogService.dart';


  GetIt locator = GetIt.instance;
void Setuplocator(){


  locator.registerLazySingleton(()=>AuthenticationService());
  locator.registerLazySingleton(()=>FirestoreService());
  locator.registerLazySingleton(() => Navigation_Services());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PushNotifications());

}
