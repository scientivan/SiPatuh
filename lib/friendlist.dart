import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';


class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 238, 205),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));}, icon: Icon(Icons.arrow_back,color: Colors.black)),
        title: 
        
        Text(
          "Friend List",
          style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),
        ),

      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill
            )
        ),

          
        )


        );
  }
}