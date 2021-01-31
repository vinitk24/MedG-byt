import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Column(
        children: [
         Shimmer.fromColors(
           baseColor: Colors.purpleAccent,
         highlightColor: Colors.purple
         ,child: Text("Welcome",style: TextStyle(fontSize: 22,color: Colors.purpleAccent),),),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("home").snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }else{
                  var items = snapshot.data.documents;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return Column(
                        mainAxisSize: MainAxisSize.max,

                          children: [
                            Container(
                              padding:EdgeInsets.only(right: 200.w,left: 10,top: 5),
                              alignment: Alignment.topLeft,
                              child: Text("${items[index].data().keys.elementAt(0)}",style:
                              TextStyle(fontSize: 16,color: Colors.green,fontWeight: FontWeight.bold),),
                            ),
                            Container(padding:EdgeInsets.only(left: 10,right: 5,top: 3),
                              alignment: Alignment.center,
                              child: Text("      ${items[index].data().values.elementAt(0)}",style:
                              TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                            ),
                            SizedBox(
                              height: 20.h
                            ),
                          ],


                      );
                    },
                  );
                }
              },
            ),
          ),

        ],
      )
    );
  }
}


