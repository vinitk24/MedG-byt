import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medg/Services/Authentication_services.dart';
import 'package:medg/Services/FirestoreService.dart';
import 'package:medg/locator.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shimmer/shimmer.dart';

import 'Reportseeothers.dart';

class Connnections extends StatefulWidget {
  @override
  _ConnnectionsState createState() => _ConnnectionsState();
}

// List<QueryDocumentSnapshot> Result;
// bool show=false;
class _ConnnectionsState extends State<Connnections> {

  TextEditingController _search = TextEditingController();

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  List<QueryDocumentSnapshot> Result=[];

  bool show = false;
   fetchUser() async {
    await _collectionReference
        .where("userName", isEqualTo: _search.text)
        .get()
        .then((value) => Result = value.docs);
    setState(() {
      Result;
      show = true;
    });

  }
  FirestoreService _firestoreService = locator<FirestoreService>();
   AuthenticationService _authenticationService = locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: true,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                width: 900.w,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: TextFormField(
                    controller: _search,
                    // validator: name,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 2, color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 2, color: Colors.purple)),
                        labelText: "Search",
                        labelStyle: TextStyle(color: Colors.purple)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {

                  await fetchUser();
                },
                child: GlowingProgressIndicator(
                    child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 21, left: 10, right: 5),
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                )),
              )
            ],
          ),
          show
              ? ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, ind) {
              return ListTile(
                isThreeLine:true,dense: false,
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.people_outline,color:Colors.green,size:50,),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 35,top: 10),
                  child: GestureDetector(
                      onTap: (){

                        ///TODO:Send Friend Request
                        //once user send request its created a request field and add id's into that
                        //and then its also reflect into to whom he is sending the friend request into his requested field
                        //and when he accepted that then its automatically removed from the requested field and added into the
                        //also check the frinds list to check weather that person is friend are not of him.
                        //
                        _firestoreService.Request(Result[ind].data()["id"]);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>ReportSeeOthers(uid:Result[ind].data()["id"])));
                      },
                      child: Tooltip(
                        message: "See Student Reports",
                          child: Icon(Icons.receipt,color: Colors.purpleAccent,size: 30,))),
                ),
                title: Text(
                  "${Result[ind].data()["fullName"]}",
                  style: TextStyle(
                      fontSize: 18, color: Colors.black),
                ),
                subtitle: Text(
                    "${Result[ind].data()["mobile"].toString().substring(0, 4)}******",
                    style: TextStyle(
                        fontSize: 18, color: Colors.black)),
              );
            },
            itemCount: Result.length,
          )
              : SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Center(child: JumpingDotsProgressIndicator(numberOfDots: 3,fontSize: 80,))
            ),
          ),
          Result.length==0&&show==true?SizedBox(
            width: 200.0,
            height: 100.0,
            child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.black,
                child: Center(child: Text("User Not Found",style: TextStyle(fontSize: 18),)),
            ),
          ):Container(),
          Spacer(),
          // Container(
          //   child: Column(
          //     children: [
          //       Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Recents",style: TextStyle(fontSize: 20),)],),
          //       StreamBuilder(
          //        stream: FirebaseFirestore.instance.collection('users').doc(_authenticationService.currentUser.id).collection("Reports").snapshots(),
          //         builder: (context,snapshot){
          //           if(snapshot.hasData){
          //             var data = snapshot.data.documents;
          //             return ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: data.length,
          //               itemBuilder: (context,index){
          //                return Card(
          //                   child: Text("here its ${data[index].data()}"),
          //                 );
          //               },
          //             );
          //           }else{
          //             return Shimmer.fromColors(
          //                 baseColor: Colors.red,
          //                 highlightColor: Colors.yellow,
          //                 child: Center(child: JumpingDotsProgressIndicator(numberOfDots: 3,fontSize: 80,))
          //             );
          //           }
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Spacer(),
        ],
      ),

    );
  }
}
