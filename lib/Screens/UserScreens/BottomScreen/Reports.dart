
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import '../../../locator.dart';
import 'Viewer.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

List<QueryDocumentSnapshot> Report=[];
AuthenticationService _authenticationService =
locator<AuthenticationService>();
final CollectionReference  _collectionReference = FirebaseFirestore.instance.collection('users');
fetchReport()async{
  String uid = _authenticationService.currentUser.id;
  await _collectionReference.doc(uid).collection("Reports").get().then((value) => Report=value.docs);


}



class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    fetchReport();
    return Column(
      children: [
        SizedBox(height: 50,),
       Expanded(
         flex: 1,
         child:  Container(padding:EdgeInsets.all(10),child: Shimmer.fromColors(child:Text("If Your not Seeing anything means your not having any Report yet,\nPlease Update your 'Report' by Clicking below button."), baseColor: Colors.red, highlightColor: Colors.purple)),),
        Divider(),
        Expanded(
          flex: 8,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').doc(_authenticationService.currentUser.id).collection("Reports").snapshots(),
            builder: (context,snapshot){
            if(snapshot.hasData){
              var items = snapshot.data.documents;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return  ListTile(
                    leading: Shimmer.fromColors(
                      child: Icon(Icons.folder_open,color: Colors.green,size: 35,),
                      highlightColor: Colors.red,
                      baseColor: Colors.purpleAccent,

                    ),
                    onTap: (){
                      //Use navigator with data as Constructor
                      Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>Viewer(data: items[index].data(),date:items[index].id)
                      ));
                    },
                    contentPadding: EdgeInsets.only(top: 5,left:20),
                    title:Text("Report-No:${index+1}"),
                    subtitle: Text("Date${items[index].id}"),
                  );
                },
                itemCount: snapshot.data.documents.length,
              );
            }else{
              return Padding(padding: EdgeInsets.only(top: 200),child:
              Center(child: JumpingText("Fetching Data...",style:
              TextStyle(color: Colors.purpleAccent,fontSize: 20),),));
            }
            }
          ),
        ),





      ],
    );
  }
}


