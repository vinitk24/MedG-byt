import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:medg/ViewModels/ReportUpdateModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';


class ReportUpdate extends StatefulWidget {

  @override
  _ReportUpdateState createState() => _ReportUpdateState();
}

class _ReportUpdateState extends State<ReportUpdate> {

  final _formkey = GlobalKey<FormFieldState>();
  ///TODO used for fetching questions online from github repos
  // List Questions=[];
  // JsonFileFetch()async{
  //   http.Response Questions_ = await  http.get("https://raw.githubusercontent.com/TejasG-007/API-s/main/api.json");
  //   print(Questions_.body.toString());
  //
  // }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // JsonFileFetch();
    return ViewModelBuilder<ReportUpdateModel>.reactive(
        viewModelBuilder: () => ReportUpdateModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: Text('Report Update'),
                leading: Container(),
                centerTitle: true,
                shadowColor: Colors.green,
              ),
              backgroundColor:  Colors.deepPurple,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: (){
              model.UpdateReport();
            },
backgroundColor:  Colors.green,
            icon: Icon(Icons.save),
            label: Text("Submit"),
          ),
          body:
                SafeArea(
                  child: Container(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("questions").snapshots(),
                      builder: (context,snapshot){

                        if(!snapshot.hasData){
                          return Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.black,
                            child: Center(child: Text("User Not Found",style: TextStyle(fontSize: 18),)),
                          );
                        }else{
                          var Questions = snapshot.data.documents;
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: Questions.length,
                            itemBuilder: (context, index) {
                              return Questions[index]["ans"]
                                  ? Container(
                                margin: EdgeInsets.only(bottom: 30),
                                    child: DropDownFormField(
                                      contentPadding: EdgeInsets.all(10),
                                      titleText: Questions[index]["question"],
                                      hintText: 'Please Choose From here',
                                      dataSource: Questions[index]["type"],
                                      textField: "display",
                                      valueField: "value",
                                      value: model.value["${Questions[index]["question"]}"],
                                      onSaved: (val) {
                                        setState(() {
                                          print(val);
                                          model.value["${Questions[index]["question"]}"] =
                                          "$val";
                                          print(model.value);
                                        });
                                      },
                                      onChanged: (val) {
                                        setState(() {
                                          print(DateTime.now()
                                              .toString()
                                              .substring(0, 11));
                                          print(val);
                                          model.value["${Questions[index]["question"]}"] =
                                          "$val";
                                          print(model.value);
                                        });
                                      },
                                    ),
                                  )
                                  : Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.radio_button_checked),
                                    Expanded(
                                      child: Text("${Questions[index]["question"]}",style:TextStyle()),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                    margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ),
            );
  }
}
