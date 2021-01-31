import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:medg/Services/FirestoreService.dart';
import 'package:medg/model/User.dart';
import '../locator.dart';


class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firebaseService = locator<FirestoreService>();
  AppUser _currentUser;
  AppUser get currentUser => _currentUser;


 bool er;
  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await populateCurentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail({
    @required String email,
    @required String password,
    String fullName,String mobile,String userName,String title
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Creating new User Profile
      _currentUser = AppUser(userName, title, mobile, email, fullName,authResult.user.uid);
      await _firebaseService.createUser(_currentUser);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

Future ForgotPass({
 String email
}) async {
  try {
    await _firebaseAuth.sendPasswordResetEmail(email:email);
  }catch (e) {
    return e.message;
  }
}

Future<bool> isUserLoggedin()async{
    var user = await _firebaseAuth.currentUser;
    await populateCurentUser(user);
    return user!=null;

}

Future populateCurentUser(User user)async{
if(user!=null){
  _currentUser = await _firebaseService.getUser(user.uid);


}


}



}