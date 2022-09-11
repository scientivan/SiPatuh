
import 'package:app/signup_widget.dart';
import 'package:app/username.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasData){
          return UserName();
        }
        else if(snapshot.hasError){
          return Center(child: Text("Error"),);
        }
        else{
          return SignUp();
        }
      },
    ),
  );
}
