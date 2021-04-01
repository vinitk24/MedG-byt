import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_reg/Sign_In.dart';
import 'package:login_reg/create_login.dart';
import 'package:login_reg/home_signin_widget.dart';

// ignore: must_be_immutable
class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();
  Duration _animationDuration = Duration(milliseconds: 500);

  void _changePage(int page) {
    pageController.animateToPage(page,
        duration: _animationDuration, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0,),
                child: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.houseUser,
                      color: Color.fromRGBO(245, 48, 111, 1.0),
                      size: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "IRO",
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(245, 48, 111, 1.0),
                          ),
                        ),
                        Text(
                          "NA",
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Best Home Service Provider App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                // physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: <Widget>[
                  // HomeSignInWidget(gotoSignIn: (){
                  //   pageController.animateToPage(1, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                  // }, goToSignUp: () {
                  //   pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                  // },),
                  HomeSignInWidget(
                    goToPageCallback: (page) {
                      _changePage(page);
                    },
                  ),
                  SignIn(dontHaveAccount: (){
                    pageController.animateToPage(2, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                  },),
                  // SignIn(),
                  CreateLogin(
                    cancelBackToHome: () {
                      _changePage(0);
                    },
                  ),

                  // CreateLogin(cancelBackToHome: (){
                  // pageController.animateToPage(0, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                  // },),

                ],
              ),

            ),
          ],

        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color.fromRGBO(255, 123, 67, 1.0),
              Color.alphaBlend(Colors.amber, Colors.amber),
              Color.fromRGBO(245, 50, 111, 1),
            ],
          ),
        ),
      ),
    );
  }
}
