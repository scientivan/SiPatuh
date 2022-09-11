import 'dart:math';
import 'dart:async';
import 'package:app/main.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:app/CameraView.dart';
import 'package:geolocator/geolocator.dart';
import 'package:app/homeScreen.dart';

class CameraScreen extends StatefulWidget {
  
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  late String output;

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  String name = '';
  String postalCode = '';
  
  String currentTime = '';
  String currentDate = '';
  
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }


  loadModel()async{
    await Tflite.loadModel(model:"assets/model.tflite",labels: "assets/labels.txt" );
  }

  loadCamera(){
    _cameraController = CameraController(cameras![0],ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  } 
  

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 30,),onPressed: (){Navigator.pop(context);},),
        title: Text(
          "Pendeteksi Helm",
          style: TextStyle(color: Colors.black,fontFamily:"Oceanwide",fontSize: 23),
        ),
        backgroundColor: Color.fromARGB(255, 254, 238, 205),

        elevation: 0.0,
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController)
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Color.fromARGB(255, 254, 238, 205),
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.black,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          }),
                      GestureDetector(
                        onTap: () {
                          if (!isRecoring) takePhoto(context);
                        },
                        child: isRecoring
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.black,
                                size: 70,
                              ),
                      ),
                      IconButton(
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.black,
                              size: 28,
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              iscamerafront = !iscamerafront;
                              transform = transform + pi;
                            });
                            int cameraPos = iscamerafront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras![cameraPos], ResolutionPreset.high);
                            cameraValue = _cameraController.initialize();
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Klik untuk Foto",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily:"Oceanwide"
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
   
    var prediction = await Tflite.runModelOnImage(
      path: file.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5
    );
    DateTime now = DateTime.now();
    currentTime = now.hour.toString() + ":" + now.minute.toString();
    currentDate = now.day.toString() + "-" + now.month.toString() + "-" + now.year.toString();
     prediction!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    
     Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: file.path,
                  output: output,
                  latitude: country,
                  longitude: street,
                  time : currentTime,
                  date : currentDate,
                )));
  }
}





