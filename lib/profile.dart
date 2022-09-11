import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}


class ProfileScreenState extends State<ProfileScreen> {


  
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 238, 205),
        leading:IconButton(onPressed: (){Navigator.of(context).pop();},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        title: Text('Akun',style: TextStyle(color: Colors.black,fontFamily:"Oceanwide",)),
        centerTitle: true,
        elevation: 0,
        ),
      body: Padding(padding: EdgeInsets.only(right: 10,left: 10,top: 15),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          CircleAvatar(
          backgroundImage: Image.network(PhotoUrl ?? '').image,
          radius: 20,
          ),
          SizedBox(width: 15,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(userProfile!,style: TextStyle(color: Colors.black,fontFamily:"Oceanwide",fontSize: 18),),
          SizedBox(height: 5,),
          Text(UserGmail ?? '',style: TextStyle(color: Colors.black,fontFamily:"Oceanwide",fontSize: 13),),
          ],
        ),
        ]
          
      ),
      ),
      SizedBox(height: 5,),
      Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
      // SizedBox(height: 10,),
      // Text("QR Code",style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),),
      // SizedBox(height: 10,),
      // FlatButton(onPressed: (){}, color: Color.fromARGB(255, 254, 238, 205),child: 
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children:[
      //     Icon(Icons.qr_code,size: 20,),
      //     SizedBox(width: 5,),
      //     Text("Profile QR Code",style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),)
          
      //     ]
      //   )
      // )
    ] 
      ),
      ),
      
    );
  }
}