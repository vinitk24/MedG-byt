import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medg/ViewModels/StartupLogic.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StartupLogic extends StatefulWidget {
  @override
  _StartupLogicState createState() => _StartupLogicState();
}

class _StartupLogicState extends State<StartupLogic> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder<StartupLogicModel>.reactive(
    onModelReady: (model)=>model.isUserloggedin(),builder: (context,model,child)=>Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          Image.asset("images/mainimage.png"),
          Spacer(),
          SizedBox(height: 100.h,),
          JumpingText("Welcome",style: TextStyle(color:Colors.purple,fontSize: 22),),
          SizedBox(height: 20.h,),
          Shimmer.fromColors(
            baseColor: Colors.purpleAccent,
            highlightColor: Colors.purple,
            child: Text("MedG",style: TextStyle(color:Colors.purple,fontSize: 40,fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 100.h,)

        ],
      ),
    ),viewModelBuilder:()=> StartupLogicModel());
  }
}
