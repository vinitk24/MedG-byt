import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Const/imagelogic-constant.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/DialogService.dart';
import 'package:medg/Services/Navigator_services.dart';
import 'package:medg/ViewModels/BaseModel.dart';
import 'package:medg/locator.dart';

class RegisterViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final Navigation_Services _navigationService = locator<Navigation_Services>();
  final DialogService _dialogService = locator<DialogService>();





alert()async{
   await _dialogService.showDialog(
     buttonTitle: "OK",
    title: "Attention",
    description: "Please Select Appropriate Status from side Toggle button.\nOnce you Select Cannot be changed in future."
  );


}

  LoginNavigate() {
    _navigationService.navigateTo(LoginViewRoute);
  }

  ForgotPassNavigate() {
    _navigationService.navigateTo(ForgotViewRoute);
  }

  onready() {
    selectedTitle = 'Parents';
  }

  get whichSelected => isSelected;

  get title => selectedTitle;

  Future signUp({
    String email,
    String password,
    String fullName,
    String userName,
    String mobile,
    String title,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,fullName: fullName,userName: userName,mobile: mobile,title: title,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.replacednavigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
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
}
