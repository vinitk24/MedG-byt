import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class Viewer extends StatelessWidget {
  Map data;
  String date;
  String name;
  Viewer({this.data,this.date,this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:SafeArea(
          top: true,
          child: Column(
            children: [
              Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Icon(Icons.calendar_today,color: Colors.purpleAccent,),
                Shimmer.fromColors(
                  child: Text("Date:$date",style: TextStyle(color: Colors.black,fontSize: 18,),),
                  highlightColor: Colors.red,
                  baseColor: Colors.purpleAccent,

                )
                ],),
              Spacer(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Shimmer.fromColors(child: Icon(Icons.keyboard_arrow_right,color:Colors.green),highlightColor: Colors.red,
                      baseColor: Colors.purpleAccent,),
                    contentPadding: EdgeInsets.only(left: 20,top: 10),
                    title: Text("${data.keys.elementAt(index)}",style: TextStyle(color: Colors.black45),),
                    subtitle: Text("${data.values.elementAt(index)}",style: TextStyle(color: Colors.green,fontSize: 18),),
                  );
                },
              ),Spacer()
            ],
          ),
        )
    );
  }
}
