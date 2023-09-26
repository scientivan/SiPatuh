
import 'package:app/friendlist.dart';
import 'package:app/google_sign_in.dart';
import 'package:app/home.dart';
import 'package:app/information.dart';
import 'package:app/loginScreen.dart';
import 'package:app/pelanggaran.dart';
import 'package:app/visualberkendara.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:app/username.dart';
import 'package:app/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String country = '';
String street = '';
String ?user;

String ?userProfile = '';
String ?userPhone = '';
String ?UserGmail = '';
String ?PhotoUrl = '';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  String name = '';
  String postalCode = '';

  void initState(){
    super.initState();
    checkGps();
    
    if(UserGmail == ''){
      getUsernameData();
    }
    else{
      setUsernameData();
    }

    if(PhotoUrl == ''){
      getPhotoURL();
    }
    else{
      setPhotoURL();
    }
  }

  setUsernameData() async{

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('gmail',UserGmail!);
  // setState(() {
  //   if(obtainedUsername != null){
  //     user = obtainedUsername;
  //     userProfile = obtainedUsername;
  //   }
  // });
  }

   getUsernameData() async{

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  UserGmail = sharedPreferences.getString('gmail');
  // setState(() {
  //   if(obtainedUsername != null){
  //     user = obtainedUsername;
  //     userProfile = obtainedUsername;
  //   }
  // });
  }

   setPhotoURL() async{
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('PhotoUrl',PhotoUrl!);
  // setState(() {
  //   if(obtainedUsername != null){
  //     user = obtainedUsername;
  //     userProfile = obtainedUsername;
  //   }
  // });
  }

   getPhotoURL() async{

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  PhotoUrl = sharedPreferences.getString('PhotoUrl');
  // setState(() {
  //   if(obtainedUsername != null){
  //     user = obtainedUsername;
  //     userProfile = obtainedUsername;
  //   }
  // });
  
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
          permission = await Geolocator.checkPermission();
        
          if (permission == LocationPermission.denied) {
              permission = await Geolocator.requestPermission();
              if (permission == LocationPermission.denied) {
                  print('Location permissions are denied');
              }else if(permission == LocationPermission.deniedForever){
                  print("'Location permissions are permanently denied");
              }else{
                  haspermission = true;
              }
          }else{
              haspermission = true;
          }

          if(haspermission){
              setState(() {
                //refresh the UI
              });

              getLocation();
          }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
        //refresh the UI
    });
}

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
        //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
          accuracy: LocationAccuracy.high, //accuracy of the location data
          distanceFilter: 100, //minimum distance (measured in meters) a 
                                //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
          locationSettings: locationSettings).listen((Position position) {
          print(position.longitude); //Output: 80.24599079
          print(position.latitude); //Output: 29.6593457

          long = position.longitude.toString();
          lat = position.latitude.toString();
          
          setState(() {
            //refresh UI on update
          });
          _getPlace();
    });
}
  void _getPlace() async {
  List<Placemark> newPlace = await placemarkFromCoordinates(position.latitude,position.longitude);

  
  setState(() {
    country = newPlace[0].country!;
    name = newPlace[0].name!;
    street = newPlace[0].locality!;
    postalCode = newPlace[0].postalCode!;
   }
  );  
}

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child:Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 238, 205),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => ProfileScreen()));}, icon: Icon(Icons.person_pin,color: Colors.black)),
        title: 
        
        Text(
          "Halo, " + user! + "!",
          style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),
        ),
        
        actions: [
          IconButton(onPressed: ()
          {
            _onBackButtonPressed(context);
          }, icon: Icon(Icons.exit_to_app,color: Colors.black,))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill
        )
        ),
        child: 
        Stack(
          children: [
            Container(width: 500,
            child:
            Padding(padding: EdgeInsets.only(bottom: 50),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 15),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17.5)),
            color:Color.fromARGB(255, 46, 61, 80),
          ),
            height: 60,
            width: 225,
            child: 
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
            ,  
            children: [
            Image.asset(
              "assets/icon 1 fix.png",
              scale: 30,
            ),
            SizedBox(width: 10,),
            Text("Pendeteksi Helm",
            style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),),
 
            ],
          )
        ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => CameraScreen()));
            },
       ),
            SizedBox(height: 25,),
        InkWell(
            child: Container(
            padding: EdgeInsets.only(left: 25,right: 4),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17.5)),
            color:Color.fromARGB(255, 46, 61, 80),
          ),
            height: 60,
            width: 225,
            child: 
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly
            ,  
            children: [
            Image.asset(
              "assets/icon 3 fix.png",
              height: 40,
            ),
            SizedBox(width: 30,),
            Text("Aturan Berkendara",
            style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),),
 
            ],
          )
        ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => Information()));
            },
       ),
       
        SizedBox(height: 25,),
        InkWell(
            child: Container(
            padding: EdgeInsets.only(left: 10,right: 0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17.5)),
            color:Color.fromARGB(255, 46, 61, 80),
          ),
            height: 60,
            width: 225,
            child: 
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: [
            Image.asset(
              "assets/icon 2 fix.png",
              height: 40,
            ),
            // SizedBox(width: 50,),
            Text("    Visualisasi\n                 Berkendara",
            style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),),
 
            ],
          )
        ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => Visualization()));
            },
       ),
        SizedBox(height: 25,),
         InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 40),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17.5)),
            color:Color.fromARGB(255, 46, 61, 80),
          ),
            height: 60,
            width: 225,
            child: 
            Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
            children: [
            Icon(Icons.timelapse,color: Colors.white,),
            // Image.asset(
            //   "assets/icon 3 fix.png",
            //   height: 40,
            // ),
            SizedBox(width: 30,),
            Text("Akan Datang",
            style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),),
 
            ],
          )
        ),
            onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (c) => CameraScreen()));
            },
       ),
        
        
          ],
          ),)
            

          
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, right: 20),
                    child:
                      InkWell(
                      child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17.5)),
                      color:Color.fromARGB(255, 46, 61, 80),
                    ),
                      height: 65,
                      width: 65,
                      child: 

                      Image.asset(
                        "assets/icon 4 fix.png",
                        scale: 8.5,
                      ),
                  ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (c) => ViolationHistory()));
                      },
       ),
        )
        ],
        )
              ],
            ),

      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //             Padding(
      //               padding: EdgeInsets.only(bottom: 20, left: 20),
      //               child:
      //                 InkWell(
      //                 child: Container(
      //                 decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(17.5)),
      //                 color:Color.fromARGB(255, 46, 61, 80),
      //               ),
      //                 height: 65,
      //                 width: 65,
      //                 child: 

      //                 Icon(Icons.search,color: Colors.white,size: 30,),
      //             ),
      //                 onTap: (){
      //                   Navigator.of(context).push(MaterialPageRoute(builder: (c) => FriendList()));
      //                 },
      //  ),
      //   )
      //   ],
      //   )
      //         ],
      //       )
            
          
          
          ],
          
          )
          
        )


        )
    );
  }
  Future<bool>_onBackButtonPressed(BuildContext context) async{
     bool? exitapp = await showDialog(
      context: context, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Color.fromARGB(255, 196, 118, 43),
        title: const Text("Keluar",style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 254, 238, 205),)),
        content: const Text("Ingin keluar dari akun?",style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 254, 238, 205),),),
        actions:<Widget> [
          TextButton(onPressed: ()
          {
            Navigator.of(context).pop(false);
          }, child: const Text('Tidak',style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 254, 238, 205),),),),
          
          TextButton(onPressed: ()
          { 
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginScreen()));
            final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
            provider.LogOut();
            finalName = true;
            
          }, child: const Text("Iya",style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 254, 238, 205),)),)
        ],
        );
      }
    );
    return exitapp ?? false;
  }
  
}