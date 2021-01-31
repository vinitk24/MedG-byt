import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medg/model/User.dart';
class FirestoreService{
  final CollectionReference  _collectionReference = FirebaseFirestore.instance.collection('users');
var _uid;
  Future createUser(AppUser user)async{

    try{
      await _collectionReference.doc(user.id).set(user.toJson());
    }catch(e){
      return e.message;
    }
  }

Future getUser(String uid)async{

try{
  _uid = uid;
  var userData = await _collectionReference.doc(uid).get();
  return AppUser.fromData(userData.data());

}catch(e){
  return e.message;


}

}
  Future addQandA(Map QandA)async{
    await _collectionReference.doc(_uid).collection("Reports").doc("${DateTime.now().toString().substring(0,11)}").set(QandA);
    return true;
  }



  //Search User Using his Username
  Future SearchUser(String username)async{
    List<QueryDocumentSnapshot> Result;
    await _collectionReference.where("userName",isEqualTo:username).get().then((value) => Result = value.docs);
    return Result;
  }


  //Friends and Reuesting
  //here Sid=>Student id;
 Future Request(String Sid)async {
   await _collectionReference.doc(_uid).update(
       {
         "Requested": FieldValue.arrayUnion([Sid])
       }
   );
   // await _collectionReference.doc(Sid).update({
   //   "Request": FieldValue.arrayUnion([_uid])
   // });

 }



  }



