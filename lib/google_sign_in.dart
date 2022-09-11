import 'package:app/homeScreen.dart';
import 'package:app/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app/username.dart';
import 'package:shared_preferences/shared_preferences.dart';
  GoogleSignInAccount? _user;
  GoogleSignInAccount get users => _user!;

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
 

  

  Future GoogleLogin() async{
    try{
      final googleUser = await googleSignIn.signIn();
      
    if(googleUser == null) {
      return;
    }
    _user = googleUser;


    final googleAuth = await googleUser.authentication;
    
    final credential  = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    UserGmail = _user!.email;
    PhotoUrl = _user!.photoUrl;
    
    }
    catch(e){
      print(e.toString());
    }
  
    notifyListeners();
  }

  Future LogOut() async{
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}