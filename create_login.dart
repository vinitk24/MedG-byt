// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class CreateLogin extends StatefulWidget {
  final Function cancelBackToHome;

  CreateLogin({this.cancelBackToHome});
  @override
  _CreateLoginState createState() => _CreateLoginState();
}

class _CreateLoginState extends State<CreateLogin> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String email,password,passwordConfirm;
  bool _termsAgreed = false;
  bool saveAttempted = false;
  // final formKey = GlobalKey<FormState>();
  // final formKey = GlobalKey<FormState>();

  // void _createUser({String em, String pw}){
  //   _auth.createUserWithEmailAndPassword(email: em, password: pw).then(
  //           (value) => (authResult){
  //     print('Hello $authResult.user');
  //   }).catchError((err){
  //     print(err);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'CREATE YOUR LOGIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              autovalidate: saveAttempted,
              onChanged: (textValue){
                setState(() {
                  email = textValue;
                });
              },
              validator: (emailValue){
                if(emailValue.isEmpty){
                  return 'This Field is Mandatory.';
                }
                String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                    "\\@" +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                    "(" +
                    "\\." +
                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                    ")+";
                RegExp regExp = new RegExp(p);

                if(regExp.hasMatch(emailValue)){
                  return null;
                }
                return 'This is not a valid email.';
              },
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                )),
                hintText: 'Enter Email',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
              ),

            ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.white,
            //         )),
            //     hintText: 'Enter Email',
            //     hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
            //     focusColor: Colors.white,
            //     focusedBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //         color: Colors.white,
            //       ),
            //     ),
            //
            //   ),
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 22.0,
            //   ),
            // ),
            // SizedBox(
            //   height: 12.0,
            // ),
            TextFormField(
              autovalidate: saveAttempted,
              onChanged: (textValue){
                setState(() {
                  password = textValue;
                });
              },
              validator: (passValue){
                if(passValue.isEmpty){
                  return 'This Field is Mandatory.';
                }

                if(passValue.length < 8){
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )),
                hintText: 'Enter Password',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),

              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              autovalidate: saveAttempted,
              onChanged: (textValue){
                setState(() {
                  passwordConfirm = textValue;
                });
              },
              validator: (passConValue){
                if(passConValue != password){
                  return 'Passwords must Match.';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )),
                hintText: 'Re-enter Password',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                focusColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),

              ),
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  activeColor: Colors.amber,
                // value: true,
                  value: _termsAgreed,onChanged: (newValue){
                  setState(() {
                    _termsAgreed = newValue;
                  });
                },
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                    "Agreed to Terms & Conditions",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell( onTap: (){
                  widget.cancelBackToHome();
                },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 38.0,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      saveAttempted=true;
                    });
                  //   if(formKey.currentState.validate()){
                  //     formKey.currentState.save();
                  //     _createUser(em: email,pw: password);
                  //   }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 34.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
