import 'package:form_field_validator/form_field_validator.dart';
final emailvalidator = EmailValidator(errorText: 'Plese Enter Valid Email');
final passwordvalidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Password should not be Empty!'),
    MinLengthValidator(8,errorText: 'Password must be at least 8 digit long '),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]
);
final name = RequiredValidator(errorText: 'Please Enter valid  Name\n (First Second Last)');

final mobile = MultiValidator([
  RequiredValidator(errorText: 'Mobile Number should not be Empty'),
  MinLengthValidator(10,errorText: 'Mobile Number must be 10 digit')
]);