import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:app/profile.dart';
bool finalName = false;

class UserName extends StatefulWidget {
  UserName({Key? key}) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {

  TextEditingController usernameController = TextEditingController();

  void initState(){
    super.initState();
    if (finalName == false)
    {
      getUsernameData().whenComplete(() async {
        if(user != null){
          Timer(Duration(seconds: 0), () => Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen())));
        }
    }
    );

    }
    
  }
   Future getUsernameData() async{

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ?obtainedUsername = sharedPreferences.getString('username');
    setState(() {
      if(obtainedUsername != null){
        user = obtainedUsername;
        userProfile = obtainedUsername;
      }
    });
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  @override
  Widget build(BuildContext context) {
     return WillPopScope(
      onWillPop: _onWillPop,
      child:
Scaffold(
      body:  
      Container(color: Color.fromARGB(255, 215, 183, 145), 
      child:
      Padding(padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(child:Text('Siapa Namamu?',style:TextStyle( fontFamily:"Oceanwide",fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black)) ,),
          SizedBox(height: 10,),
          TextField(
          controller: usernameController,
          decoration: InputDecoration(
          hintText: 'Nama',
          border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.done,
          
          ),
          ElevatedButton(
             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 254, 238, 205),),),
            onPressed:() async{
              user =  usernameController.text;
              userProfile = usernameController.text;
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('username', user!);
              finalName = false;
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));
            },
            child:Center(child:Text("Selanjutnya",style:TextStyle( fontFamily:"Oceanwide",fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black) ),),
          ),
          
        ],
        ),
        )
        
      )
      )
      
     );
    
  }
}