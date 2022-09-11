
import 'package:app/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String ?container_1_pelanggaran = '';
String ?container_2_pelanggaran = '';
String ?container_3_pelanggaran = '';
String ?container_4_pelanggaran = '';

String ?container_1_waktu = '';
String ?container_2_waktu = '';
String ?container_3_waktu = '';
String ?container_4_waktu = '';

String ?container_1_lokasi = '';
String ?container_2_lokasi = '';
String ?container_3_lokasi = '';
String ?container_4_lokasi = '';

String ?container_1_jam = '';
String ?container_2_jam = '';
String ?container_3_jam = '';
String ?container_4_jam = '';

bool container_1 = false;
bool container_2 = false;
bool container_3 = false;
bool container_4 = false;

class ViolationHistory extends StatefulWidget {
  const ViolationHistory({Key? key}) : super(key: key);

  @override
  State<ViolationHistory> createState() => _ViolationHistoryState();
}

class _ViolationHistoryState extends State<ViolationHistory> {
  @override
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection("DetectionResult").snapshots();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riwayat Pelanggaran",style: TextStyle(fontFamily:"Oceanwide",color: Colors.black),),
      backgroundColor: Color.fromARGB(255, 254, 238, 205),
      elevation: 0.0,
      leading: IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));}, icon: Icon(Icons.arrow_back,color: Colors.black)),
      
      ),
      
      body: 
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.png"),
            fit: BoxFit.fill
            )
        ),
      child: 
      
      Column(
        children: [
        SizedBox(height: 28,),
        // Row(
        // children: [
        //   IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));}, icon: Icon(Icons.arrow_back)),
        // ],
        // ),
         Padding(padding:EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: 
            Column(
            children: [
              
              Container(
                height: 125,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/container.png"),
                    fit: BoxFit.fill,
                    
                    )
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(container_4_jam!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 10),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(container_4_pelanggaran!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                    Text(container_4_waktu!  + " / " + container_4_lokasi!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 12),),
                    
                  ],
                  )
                  
                ],
              )
                
                
                
              ),
              Container(
                height: 125,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/container.png"),
                    fit: BoxFit.fill,
                    
                    )
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(container_3_jam!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 10),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(container_3_pelanggaran!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                    Text(container_3_waktu!  + " / " + container_3_lokasi!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 12),),
                    
                  ],
                  )
                  
                ],
              )
                
                
                
              ),
              Container(
                height: 125,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/container.png"),
                    fit: BoxFit.fill,
                    
                    )
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(container_2_jam!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 10),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(container_2_pelanggaran!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                    Text(container_2_waktu!  + " / " + container_2_lokasi!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 12),),
                    
                  ],
                  )
                  
                ],
              )
                
                
                
              ),

              Container(
                height: 125,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/container.png"),
                    fit: BoxFit.fill,
                    
                    )
                ),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 20,),
                      Text(container_1_jam!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 10),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(container_1_pelanggaran!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                    Text(container_1_waktu!  + " / " + container_1_lokasi!, style: TextStyle(fontFamily:"Oceanwide",color: Colors.black,fontSize: 12),),
                    
                  ],
                  )
                  
                ],
              )
                
                
                
              ),
            ]
            ),
          

          
          

         ),
      ]
      ),
      
      ),
    );
  }
}