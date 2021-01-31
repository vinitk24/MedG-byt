import 'package:medg/Const/RoutesNames.dart';
import 'package:medg/Const/constColorComb.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:shimmer/shimmer.dart';

import '../../locator.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String Fullname;

  String Mobile;
  String title;

  assigner() {
    Fullname = _authenticationService.currentUser.fullName!=null?_authenticationService.currentUser.fullName:'loading_fullname';
    Mobile = _authenticationService.currentUser.mobile!=null?_authenticationService.currentUser.mobile:'loading_mobile';
    title = _authenticationService.currentUser.title!=null?_authenticationService.currentUser.title:'loading_title';
  }



  @override
  Widget build(BuildContext context) {
    assigner();
    return SafeArea(
      child: ListView(
          padding: EdgeInsets.all(1),
          children: [
            SizedBox(
              child: Center(child: Shimmer.fromColors(
                  baseColor: Colors.purple,
                  highlightColor: Colors.purpleAccent,child:
              Text("MedG",style: TextStyle(color: Colors.purpleAccent,letterSpacing: 0.9,fontSize: 20,fontWeight: FontWeight.bold),)),), height: 80.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 3,left: 3),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.edit,color: Colors.purple,size: 25,)],
                    ),
                  ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Personal Information",style: TextStyle(fontWeight: FontWeight.bold),)],),
                  Stack(
                    children: [
                      Row(
                        children:[ Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 250.h,
                            child:Image.asset("images/$title.png",),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey

                            ),
                          ),
                        ),
                        Expanded(child: Text("\n$Fullname\n\n $Mobile",style:TextStyle(fontSize: 18,color: Colors.black)),)]
                      ,),
                      SizedBox(height: 280.h,),
                      Padding(
                        padding: EdgeInsets.only(top: 280.h,left: 8,right: 700.w),
                        child: Row(
                          children: [
                            Expanded(

                              child: Container(
                                alignment: Alignment.center,
                                child:Text("        $title",style: TextStyle(fontWeight: FontWeight.bold),),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              width: 10.w,
              height: 500.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(10.0,10.0),
                      spreadRadius: 0.08,
                      blurRadius: 30,
                      color: Colors.black12,
                    )
                  ]),
            ),
            SizedBox(height: 80.h,),
            ListTile(
              onTap: (){
                 showDialog(
                   context: context,
                   builder: (BuildContext context){
                     return AlertDialog(
                       actions: <Widget>[
                         FlatButton(child: Text('Okay.'), onPressed: () {
                           Navigator.pop(context);
                         }),
                       ],
                       title: Text("For the purpose of these Terms of Use, along with any amendments "
                           "to the same, and wherever the context so requires “You”, ”Your” or “User” "
                           "shall mean any natural or legal person who has agreed to become a user of the "
                           "Website. The term “We”, “Us”, “Our”, “Company”,” Medg” shall mean the Expedient "
                           "Healthcare Pvt. Ltd. (which includes successors, representative-in-interest and "
                           "permitted assigns). “Third Party” shall mean and refer to any individual(s), "
                           "company or entity apart from the User and  Medg.\nThese Terms of Use, Privacy "
                           "policy, together with any additional Service specific terms and conditions, "
                           "other policies which may be applicable and/or available on our App,MedG and any"
                           " disclaimers which may be present on the App/Application are jointly referred to as"
                           " “Terms of Use or Agreement” and constitute the terms of your access and use of the "
                           "App/Application and the Services. "
                     "In case of non-compliance with any applicable laws, rules or regulations, or the Agreement by a User, "
                           " Medg has the right to immediately terminate the access or"
                           " usage rights of the User to the Services and to remove "
                           "non-compliant information.",textScaleFactor:0.8,style: TextStyle(fontSize: 15),),
                     );
                   }
                 );
              },
                leading: Icon(
                  Icons.error_outline,
                  color: drwiconcolor,
                ),
                title:
                Text('Terms and Conditions ',
                    style: TextStyle(
                      fontSize: font_,
                    ))
            ),
            ListTile(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          actions: <Widget>[
                            FlatButton(child: Text('Okay.'), onPressed: () {
                              Navigator.pop(context);
                            }),
                          ],
                          title: Text("This App is in Beta testing.\n You Can write us on tejasgathekar78@gmail.com",style: TextStyle(fontSize: 15),),
                        );
                      }
                  );
                },
              leading: Icon(
                Icons.help,
                color: drwiconcolor,
              ),
              title:
                  Text('Help and Feedback',
                      style: TextStyle(
                        fontSize: font_,
                      ))
              ),
            ListTile(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          actions: <Widget>[
                            FlatButton(child: Text('Okay.'), onPressed: () {
                              Navigator.pop(context);
                            }),
                          ],
                          title: Text("Write us on https://mateg.tech",style: TextStyle(fontSize: 15),),
                        );
                      }
                  );
                },
                leading: Icon(
                  Icons.perm_identity,
                  color: drwiconcolor,
                ),
                title:
                Text('Contact Us',
                    style: TextStyle(
                      fontSize: font_,
                    ))
            ),ListTile(
              onTap: () async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut().then((value) =>
    Navigator.of(context).pushReplacementNamed(LoginViewRoute));
    },
                leading: Icon(
                  Icons.exit_to_app,
                  color: drwiconcolor,
                ),
                title:
                Text('Sign Out',
                    style: TextStyle(
                      fontSize: font_,
                    ))
            ),

          ],
        ),
    );
  }
}
