
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';
import '../../../locator.dart';
import 'Viewer.dart';




class ReportSeeOthers extends StatelessWidget {
  String uid;
  ReportSeeOthers({this.uid});
  var Name;//


List<QueryDocumentSnapshot> Report=[];
AuthenticationService _authenticationService =
locator<AuthenticationService>();
final CollectionReference  _collectionReference = FirebaseFirestore.instance.collection('users');
fetchReport()async{
  await _collectionReference.doc(uid).collection("Reports").get().then((value) => Report=value.docs);

}

  @override
  Widget build(BuildContext context) {
    fetchReport();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(padding:EdgeInsets.all(10),child: Shimmer.fromColors(child:Text("If Your not Seeing anything means your not having any Report yet,\nPlease Update your 'Report' by Clicking below button."), baseColor: Colors.red, highlightColor: Colors.purple)),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(uid).collection("Reports").snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){return Padding(padding: EdgeInsets.only(top: 200),child:
                    Center(child: JumpingText("Fetching Data...",style:
                    TextStyle(color: Colors.purpleAccent,fontSize: 20),),));}
                    else{
                      var items = snapshot.data.documents;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return  ListTile(
                            leading: Icon(Icons.folder_open,color: Colors.green,size: 35,),
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
                    }

                  }
              ),
            ),





          ],
        ),
      ),
    );
  }
}



