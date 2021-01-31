import 'package:flutter/material.dart';
import 'package:medg/Const/constColorComb.dart';
import 'package:medg/Const/validator_.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medg/Screens/Forgotpass.dart';
import 'package:medg/Screens/Register.dart';
import 'package:medg/Screens/Widgets/Busy_Button.dart';
import 'package:medg/ViewModels/LoginViewModel.dart';
import 'package:stacked/stacked.dart';



//==================================Enum for returning value ===
List<String> selectionTitle = ['Parents', 'Doctor', 'Hostell_Head', 'Student'];




class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

@override
void dispose(){
  super.dispose();
    email.dispose();
    password.dispose();

}

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);


    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: ()=>LoginViewModel(),
      onModelReady: (model)=>model.onready(),
      builder: (context,model,child)=>Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80.h,),
                Image(
                  image: AssetImage('images/mainimage.png'),
                ),
                ToggleButtons(
                    color: Colors.black,
                    borderColor: purple_,
                    selectedColor: purple,
                    children: <Widget>[
                      ImageIcon(AssetImage('images/Parents.png')),
                      ImageIcon(AssetImage('images/Doctor.png')),
                      ImageIcon(AssetImage('images/Hostel_Head.png')),
                      ImageIcon(AssetImage('images/Student.png')),
                    ],
                    isSelected: model.whichSelected,
                    onPressed: model.togglebutton(),
                    ),
                SizedBox(
                  height: 50.h,
                ),
                Container(child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        child:  Image(
                          image: AssetImage('images/${model.title}.png'),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Text(
                        model.title== null? 'Parents' :model.title,
                        style: TextStyle(
                            fontSize: fheading, fontFamily: hfamily, color: purple),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: emailvalidator,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.alternate_email),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 2, color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 2, color: Colors.purple)),
                              labelText: "Email",
                              labelStyle: TextStyle(color: purple)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          obscureText: true,
                          controller: password,
                          validator: passwordvalidator,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 2, color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 2, color: Colors.purple)),
                              labelText: "Password",
                              labelStyle: TextStyle(color: purple)),
                        ),
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                          BusyButton(title: "Login", onPressed:(){
                            if(_formkey.currentState.validate()){
                              model.login(email:email.text,password:password.text);
                            }
                          },busy: model.busy,)
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          //here we are showing the dialog box to the user for his better understanding of status

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>SignUpView()));
                        },
                        child: Text(
                          'Don\'t have Account ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: purple,
                              fontSize: font_,
                              fontFamily: ffamily),
                        )),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children:[ GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotView()));
                      },
                      child: Text(
                        'Forgot Password ?  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: purple,
                            fontSize: font_,
                            fontFamily: ffamily),
                      )),]
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
      ),
            )),
    );
  }
}

