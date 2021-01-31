import 'package:flutter/material.dart';
import 'package:medg/Const/constColorComb.dart';
import 'package:medg/Const/validator_.dart';
import 'package:medg/Screens/Widgets/Busy_Button.dart';
import 'package:medg/ViewModels/ForgotViewModel.dart';
import 'package:stacked/stacked.dart';

//==================================Enum for returning value ===
//--------------------enum end

class ForgotView extends StatefulWidget {
  @override
  _ForgotViewState createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<ForgotViewModel>.reactive(
      viewModelBuilder: () => ForgotViewModel(),
      onModelReady: (model) => model.onready(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: height/20,),
            Image(
              image: AssetImage('images/mainimage.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Password Recovery',
                  style: TextStyle(
                      fontFamily: hfamily, color: purple, fontSize: fheading),
                )
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            ToggleButtons(
                selectedColor: purple,
                disabledColor: Colors.black,
                color: Colors.black,
                borderColor: purple_,
                children: <Widget>[
                  ImageIcon(AssetImage('images/Parents.png')),
                  ImageIcon(AssetImage('images/Doctor.png')),
                  ImageIcon(AssetImage('images/Hostel_Head.png')),
                  ImageIcon(AssetImage('images/Student.png')),
                ],
                isSelected: model.whichSelected,
                onPressed: model.togglebutton()),
            SizedBox(
              height: height / 50,
            ),
            Container(
                child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: model.whichSelected == null
                        ? Image(
                            image: AssetImage('images/Parents.png'),
                          )
                        : Image(
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
                      controller: email,
                      validator: emailvalidator,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                          labelText: "Enter Email",
                          labelStyle: TextStyle(color: purple)),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(
              height: height / 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BusyButton(

                  title: "Continue",
                  busy: model.busy,
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                      model.ForgotPass(email.text);
                    }
                  },
                )
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
          ],
        )),
      ),
    );
  }
}
