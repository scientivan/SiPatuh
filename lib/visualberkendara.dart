import 'package:flutter/material.dart';
import 'package:app/homeScreen.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Visualization extends StatefulWidget {
  Visualization({Key? key}) : super(key: key);

  @override
  State<Visualization> createState() => _VisualizationState();
}

class _VisualizationState extends State<Visualization> {
  // late YoutubePlayerController ytController;
  // TextEditingController linkController = TextEditingController();
  // TextEditingController seekController = TextEditingController();

  // void initState(){
  //       ytController = YoutubePlayerController(
  //     initialVideoId: 'TQ0hL1Ibz4M',
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: true,
  //       mute: false,
  //     ),
  //   );
  //   super.initState();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 238, 205),
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 30,),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));},),
        title: Text(
          "Visualisasi Berkendara",
          style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
        Container(
        width: 450,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/3.png"),
            fit: BoxFit.fill
            )
        ),
      child: 
      Padding(padding: EdgeInsets.only(left: 10,right: 10),
      child: 
       Column(children: [
          SizedBox(height: 50,),
          // Text(
          // "Teknik Berkendara Yang Benar",
          // style: TextStyle(color: Colors.black,fontFamily:"Oceanwide",fontSize: 20),
          // ),
          // SizedBox(height: 10,),
          Image(image: AssetImage("assets/gbr.png"),),
          SizedBox(height: 15,),
          SelectableText(
          "http://urbancikarang.com/m/page.php?halaman=Infografis-Keselamatan-dan-Ketertiban-Berkendara-Roda-Dua-di-Jalan#.Yv5NsS5BzIU&gsc.tab=0",
          style: TextStyle(color: Color.fromARGB(255, 254, 238, 205),fontFamily:"Oceanwide",fontSize: 8),
           ),
          SizedBox(height: 50,),
          Image(image: AssetImage("assets/infografis-tips-posisi-berkendara-motor-yang-ideal-1.jpeg")),
          SizedBox(height: 15,),
          SelectableText(
          "https://www.cnnindonesia.com/teknologi/20211022180811-387-711143/infografis-posisi-berkendara-motor-yang-ideal",
          style: TextStyle(color: Color.fromARGB(255, 254, 238, 205),fontFamily:"Oceanwide",fontSize: 8),
           ),
          SizedBox(height: 50,),
          Image(image: AssetImage("assets/infografis-riding-position-640x514.jpg")),
          SizedBox(height: 15,),
          SelectableText(
          "https://www.otobandung.com/2018/11/03/posisi-berkendara-yang-benar-untuk-pengguna-motor-matik/",
          style: TextStyle(color: Color.fromARGB(255, 254, 238, 205),fontFamily:"Oceanwide",fontSize: 8),
           ),
          SizedBox(height: 50,),
        ],
        
        )      
        )
      ),
      )
    );
  }
}
