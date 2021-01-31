import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:medg/Const/constColorComb.dart';
import 'package:medg/Const/validator_.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medg/Screens/Widgets/Busy_Button.dart';
import 'package:stacked/stacked.dart';
import 'package:medg/ViewModels/RegisterViewModel.dart';

//This list is Used for naming the Appropiate Users

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formkey = GlobalKey<FormState>();
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("users");
  TextEditingController email = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    fullName.dispose();
    mobileNo.dispose();
    email.dispose();
    password.dispose();
  }


  AlertBox(String img,String title){
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child:Image.asset(img),
        ),
        Text(title)
      ],
    );
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) =>  AlertDialog(
          title:  Text("Title Selection Alert",style: TextStyle(color: Colors.red),),
          content:  Column(
            children: [
              Text("Please Select Appropriate Title While Filling the Registration Form."),
             Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
               AlertBox("images/Parents.png","Parents"),
               AlertBox("images/Doctor.png","Doctor"),
             ],),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AlertBox("images/Student.png","Student"),
                  AlertBox("images/Hostel_Head.png","Hostel_Head"),
                ],),
              Spacer(),
              Text("Once You Selected the Title Cannot be Modify Letter by your side."),
              Spacer(),
              Text("Note: If You Selected wrong title please writes us on admin@medg.org with your Full-name,mobile and email.")



            ],
          ),
          actions: <Widget>[
             FlatButton(
              child:  Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      onModelReady: (model) => model.onready(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80.h,),
            Image(
              image: AssetImage('images/mainimage.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ToggleButtons(
                selectedColor: purple,
                color: Colors.black,
                borderColor: purple_,
                children: <Widget>[
                  ImageIcon(AssetImage('images/Parents.png')),
                  ImageIcon(AssetImage('images/Doctor.png')),
                  ImageIcon(AssetImage('images/Hostel_Head.png')),
                  ImageIcon(AssetImage('images/Student.png')),
                ],
                isSelected: model.whichSelected,
                onPressed: model.togglebutton()),],),
            SizedBox(
              height: 50.h,
            ),
            Container(
                child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage('images/${model.title}.png'),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Text(
                    model.title == null ? 'Parents' : model.title,
                    style: TextStyle(
                        fontSize: fheading, fontFamily: hfamily, color: purple),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      controller: fullName,
                      validator: name,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.purple)),
                          labelText: "Full Name",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      controller: username,
                      validator: name,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_pin),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.purple)),
                          labelText: "Username",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      controller: mobileNo,
                      validator: mobile,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.call),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.purple)),
                          labelText: "Mobile",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      controller: email,
                      validator: emailvalidator,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.purple)),
                          labelText: "Email",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: TextFormField(
                      controller: password,
                      validator: passwordvalidator,
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.purple)),
                          labelText: "Password",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             BusyButton(title: "Register", onPressed: (){
              if(_formkey.currentState.validate()){
                model.signUp(email:email.text, password:password.text,mobile: mobileNo.text,title: model.title,userName: username.text,fullName: fullName.text);
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
                     model.LoginNavigate();
                    },
                    child: Text(
                      'Already Have Account ?  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: purple,
                          fontSize: font_,
                          fontFamily: ffamily),
                    )),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
            SizedBox(height: 80.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      model.ForgotPassNavigate();
                    },
                    child: Text(
                      'Forgot Password ?  ',
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
            )
          ],
        )),
      ),
    );
  }
}
