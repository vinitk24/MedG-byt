
import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Services/DialogService.dart';
import 'package:medg/Services/FirestoreService.dart';
import 'package:medg/Services/Navigator_services.dart';
import 'package:medg/ViewModels/BaseModel.dart';
import 'package:medg/locator.dart';


class ReportUpdateModel extends BaseModel {

FirestoreService _firestoreService = locator<FirestoreService>();
final DialogService _dialogService = locator<DialogService>();
final Navigation_Services _navigationService = locator<Navigation_Services>();

Map<String, String> value = {};

Future UpdateReport()async{
 var result =  await _firestoreService.addQandA(value);
  if(result){
    return await _dialogService.showDialog(
        title: 'Done',
        description: 'Your Information/Report has been Uploaded',
        buttonTitle: 'Close'
    );
  }

}



}