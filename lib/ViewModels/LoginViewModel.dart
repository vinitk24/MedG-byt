
import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Const/imagelogic-constant.dart';
import 'package:medg/Services/DialogService.dart';
import 'package:medg/Services/Navigator_services.dart';
import '../locator.dart';
import 'BaseModel.dart';

class LoginViewModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final Navigation_Services _navigationService = locator<Navigation_Services>();

  ForgotPassNavigate(){
     _navigationService.navigateTo(ForgotViewRoute);
  }

  onready() {
    selectedTitle = 'Parents';
  }

  get whichSelected => isSelected;

  get title => selectedTitle;

  Function togglebutton() {
    return (int index) {
      for (int indexBtn = 0;
      indexBtn < isSelected.length;
      indexBtn++) {
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

  Future login({
    String email,
   String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.replacednavigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}

