import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';


class HomeSignInWidget extends StatelessWidget {
  final Function(int) goToPageCallback;
  // final Function goToSignUp;
  // final Function gotoSignIn;
  // HomeSignInWidget({this.goToSignUp,this.gotoSignIn});
  HomeSignInWidget({this.goToPageCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.facebookF,
                color: Colors.red,
                size: 30.0,
              ),
              Text(
                " | Sign In with Facebook",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height : 20.0,),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.twitter,
                color: Colors.red,
                size: 30.0,
              ),
              Text(
                " | Sign In with Twitter",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height : 20.0,),
        InkWell(
        //   onTap: (){
        //   goToSignUp();
        // },
          onTap: () {
            goToPageCallback(2);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height : 20.0,),
        InkWell(
        //   onTap: (){
        //   gotoSignIn();
        // },
          onTap: () {
            goToPageCallback(1);
          },
          child: Text("Already Registered? SIGN IN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );

  }
}
