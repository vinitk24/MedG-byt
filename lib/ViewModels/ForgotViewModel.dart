import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Const/imagelogic-constant.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/DialogService.dart';
import 'package:medg/Services/Navigator_services.dart';
import 'package:medg/ViewModels/BaseModel.dart';

import '../locator.dart';

class ForgotViewModel extends BaseModel {
  final AuthenticationService _authenticationServices =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final Navigation_Services _navigationService = locator<Navigation_Services>();
  get whichSelected => isSelected;

  get title => selectedTitle;



  onready() {
    selectedTitle = 'Parents';
  }

  Function togglebutton() {
    return (int index) {
      for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
        if (indexBtn == index) {
          isSelected[indexBtn] = true;
          selectedTitle = selectionTitle[indexBtn];
          print(selectedTitle);
        } else {
          isSelected[indexBtn] = false;
        }
        notifyListeners();
      }
    };
  }

  Future ForgotPass(String email) async {
    setBusy(true);
    var result = await _authenticationServices.ForgotPass(email: email);
    setBusy(false);
    if (_authenticationServices.er==null) {
      if (_authenticationServices.er==false) {
        _navigationService.navigateTo(LoginViewRoute);
        await _dialogService.showDialog(
          title: 'Reset Link has been sent',
          description: 'Please Open Your Mail and reset password',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Reset Failure',
        description: result,
      );
    }
  }
}
