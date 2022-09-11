
import 'package:app/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

String ?finalPhone;
bool finalphone = false;

class SignUp extends StatefulWidget {  

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 
  // String dialCodeDigits = "+62";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         Container(
          color: Color.fromARGB(255, 215, 183, 145),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
        Padding(padding: const EdgeInsets.only(left: 28.0,right:28.0),child: Text("Masukkan Gmail Anda Di Bawah Ini!",style: TextStyle(fontFamily:"Oceanwide",color: Colors.black),)),

        Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 254, 238, 205),),
              ),
            onPressed:() async{
              final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
              provider.GoogleLogin(); 
              
            },
            child:
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/google-login-icon-24.png',scale: 10,),
              
              Text("Login Dengan Google",style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontWeight: FontWeight.bold),) ,
            ],
          
          )
            
        ),
        ),
      ],
      ),
         )
    );
  }
}
