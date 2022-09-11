import 'package:app/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app/pelanggaran.dart';
//import 'package:app/location_service.dart';
//import 'package:geocoding/geocoding.dart';


class CameraViewPage extends StatelessWidget {
  const CameraViewPage({Key? key, this.path = '',this.output = '', this.latitude = '', this.longitude = '',this.time = '',this.date = ''}) : super(key: key);
  final String path;
  final String output;
  final String latitude;
  final String longitude;
  final String time;
  final String date;


  @override
  Future<bool> _onWillPop() async {
    return false;
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
     
      body: 
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.png"),
            fit: BoxFit.fill
            )
          ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(children: [
                  IconButton(icon: Icon(Icons.arrow_back,size: 30,), onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));
                    // Map <String,dynamic> data = {'field 1' : output};
                    // FirebaseFirestore.instance.collection("DetectionResult").add(data);
                    if(output != "Helm" )
                    {
                      if (container_1_pelanggaran == '' )
                    {
                      container_1_jam = time;
                      container_1_pelanggaran = 'Tidak Memakai Helm';
                      container_1_lokasi = longitude +", " + latitude;
                      container_1_waktu = date;
                    }
                    else if (container_2_pelanggaran == '')
                    {
                      container_2_jam = time;
                      container_2_pelanggaran = 'Tidak Memakai Helm';
                      container_2_lokasi = longitude +", " + latitude;
                      container_2_waktu = date;
                    }
                    else if (container_3_pelanggaran == '')
                    {
                      container_3_jam = time;
                      container_3_pelanggaran = 'Tidak Memakai Helm';
                      container_3_lokasi = longitude +", " + latitude;
                      container_3_waktu = date;
                    }
                    else if (container_4_pelanggaran == '')
                    {
                      container_4_jam = time;
                      container_4_pelanggaran = 'Tidak Memakai Helm';
                      container_4_lokasi = longitude +", " + latitude;
                      container_4_waktu = date;
                    }

                    else if (container_1_pelanggaran != '' && container_2_pelanggaran != '' && container_3_pelanggaran != '' && container_4_pelanggaran != '')
                    {
                      container_1_pelanggaran = 'Tidak Memakai Helm';
                      container_1_lokasi = longitude +", " + latitude;
                      container_1_waktu = date;
                      container_1_jam = time;
                      
                      container_2_pelanggaran = '';
                      container_2_lokasi = "";
                      container_2_waktu = "";

                      container_3_pelanggaran = '';
                      container_3_lokasi = "";
                      container_3_waktu = "";

                     container_4_pelanggaran = '';
                      container_4_lokasi = "";
                      container_4_waktu = "";
                    }
                    }
                    
                    }, 
                  ),
                ],
                ),
                SizedBox(height: 100,),
                Icon(output == 'Helm'? Icons.verified_user : Icons.cancel, color: output == 'Helm'? Color.fromARGB(255, 163, 255, 166) : Color.fromARGB(255, 254, 180, 180)),
                SizedBox(height: 10,),
                Text("Status: " + output,style: TextStyle(fontFamily:"Oceanwide",fontWeight: FontWeight.bold,fontSize: 15,color: output == 'Helm'? Color.fromARGB(255, 163, 255, 166) : Color.fromARGB(255, 254, 180, 180))),  

                  
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 215, 183, 145),
                        offset: Offset(4.0,4.0),
                        spreadRadius: 1.0,
                      )
                    ]
                  ),
                child: Column(children: [ 
                  SizedBox(height:30),
                  Center(
                    child: 
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(Icons.place,size:15),
                    SizedBox(width:5,),
                    Text(longitude +", " + latitude, style:TextStyle(fontFamily:"Oceanwide",fontSize: 13,fontWeight: FontWeight.bold),), 
                    ],)

                    
                  ),
                  SizedBox(height:50),
                  Center(
                    child: 
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                    Icon(Icons.calendar_today,size:15),
                    SizedBox(width:5),
                    Text(date,style:TextStyle(fontFamily:"Oceanwide",fontSize: 15,fontWeight: FontWeight.bold),),
                    SizedBox(width: 60,),
                    Icon(Icons.access_time,size:15),
                    SizedBox(width:5),
                    Text(time,style:TextStyle(fontFamily:"Oceanwide",fontSize: 15,fontWeight: FontWeight.bold),)
                    ],)

                  ),
                  
                ]
              ),
            ),
            ],
            ), 
          ),
            
          ],
        ),
      ),
    )
    );
  }
}