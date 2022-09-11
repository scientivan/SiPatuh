import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

class Information extends StatefulWidget {

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 254, 238, 205),
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded,color: Colors.black,size: 30,),onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));},),
        title: Text(
          "Aturan Berkendara",
          style: TextStyle(color: Colors.black,fontFamily:"Oceanwide"),
        ),
      ),
      body: SingleChildScrollView(
        child: 
        Container(
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 247, 190, 121),
          image: DecorationImage(
            image: AssetImage("assets/3.png"),
            fit: BoxFit.fitHeight
            )
        ),

      // Color.fromARGB(255, 46, 61, 80),
      // Color.fromARGB(255, 136, 148, 162),
      // Color.fromARGB(255, 254, 238, 205),
      // Color.fromARGB(255, 247, 190, 121),
      // Color.fromARGB(255, 247, 190, 121),
        child: 
          Column(
            children: <Widget>[
              // SizedBox(height: 20,),
              // Row(children: [IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomeScreen()));}, icon: Icon(Icons.arrow_back,size: 30,)),],),
              SizedBox(height: 25,),
              Padding(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
              child:
              Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              
              Row(
                children: <Widget>[
                  SelectableText(
                    "Aturan & Peraturan" + "\nMenurut Hukum",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily:"Oceanwide"),
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1.5,
                color: Colors.white,
              ),
              
              SizedBox(
                height: 10,
              ),
              SelectableText(
                "• Aturan Berlalu Lintas Yang Perlu Diketahui",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily:"Oceanwide"),
              ),
              SizedBox(
                height: 10,
              ),

              SelectableText(
                "\nFitur informasi ini memaparkan aturan serta peraturan menurut hukum dan perundangan yang berlaku di Indonesia. Selain itu, fitur ini memberikan informasi mengenai : tata tertib berlalu lintas, kepemilikan surat ijin berkendara (SIM), surat tanda nomor kepemilikan kendaraan (STNK), informasi rambu-rambu lalu lintas, cara berkendara dengan aman (Safety Riding), dan persyaratan berlalu lintas. Dasar-dasar aturan berlalu lintas yang perlu diketahui, diantaranya sebagai berikut:\n\n", 
              style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),
              ),
              
              SelectableText(
                "1. Pengendara harus memiliki Surat Ijin Mengemudi (SIM)", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nBerikut ini adalah fungsi Surat Izin Mengemudi (SIM) berdasarkan Undang-Undang RI Nomor 22 Tahun 2009 Tentang Lalu Lintas Dan Angkutan Jalan, Pasal 86." + "\n\n1.1  Surat Izin Mengemudi berfungsi sebagai bukti kompetensi mengemudi."+ "\n\n1.2  Surat Izin Mengemudi berfungsi sebagai registrasi Pengemudi Kendaraan Bermotor yang memuat keterangan identitas lengkap Pengemudi." + "\n\n1.3  Data pada registrasi Pengemudi dapat digunakan untuk mendukung kegiatan penyelidikan, penyidikan, dan identifikasi forensik kepolisian.\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

               SelectableText(
                "2. Larangan menaikkan motor ke trotoar", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nUndang-Undang Nomor 22 Tahun 2009 tentang Lalu Lintas dan Angkutan Jalan, pasal 131 dengan jelas telah mengatur tentang hak pejalan kaki di jalan raya:" + "\n\n2.1  Pejalan kaki berhak atas ketersediaan fasilitas pendukung yang berupa trotoar, tempat penyeberangan, dan fasilitas lain." + "\n\n2.2  Pejalan kaki berhak mendapatkan prioritas pada saat menyeberang jalan di tempat penyeberangan." + "\n\n2.3  Dalam hal belum tersedia fasilitas sebagaimana dimaksud pada ayat (1), pejalan kaki berhak menyeberang di tempat yang dipilih dengan memperhatikan keselamatan dirinya.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "3. Hormati Pesepeda dan Pejalan Kaki", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

               SelectableText(
                 "\nJalan raya bukan hanya untuk dilintasi oleh kendaraan bermotor saja. Pejalan kaki dan pesepeda juga berhak menggunakannya. Hal ini sesuai dengan UU No 22 Tahun 2009 Tentang Lalu Lintas dan Angkutan Jalan, Pasal 106 Ayat (2) yang mengatur:" + "\n\n3.1  Para pengendara, baik roda dua maupun roda empat/lebih, harus mengutamakan keselamatan pejalan kaki dan pesepeda.\n\n3.2  Bagi mereka yang tidak mengindahkan aturan ini akan dipidana dengan pidana kurungan paling lama dua bulan atau,denda paling banyak Rp 500.000.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "4. Hak Pejalan Kaki", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nSesuai dengan Undang-Undang Nomor 22 tahun 2009 tentang Lalu Lintas dan Angkutan Jalan, pasal 131 ayat 1, 2, 3, sebagai berikut : \n\n"+ "4.1  Pejalan kaki berhak atas ketersediaan fasilitas pendukung yang berupa trotoar, tempat penyeberangan, dan fasilitas lain.\n\n" + "4.2  Pejalan kaki berhak mendapatkan prioritas pada saat menyeberang jalan di tempat penyeberangan.\n\n" + "4.3  Dalam hal belum tersedia fasilitas sebagaimana dimaksud pada ayat (1), pejalan kaki berhak menyeberang di tempat yang dipilih dengan memperhatikan keselamatan dirinya.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "5. Larangan penggunaan HP saat berkendara", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nUndang-Undang Nomor 22 Tahun 2009 tentang Lalu Lintas dan Angkutan Jalan, pasal 283 telah mengatur bahwa setiap orang yang mengemudikan kendaraan bermotor di jalan secara tidak wajar dan melakukan kegiatan lain atau dipengaruhi oleh suatu keadaan yang mengakibatkan gangguan konsentrasi dalam mengemudi, akan dipidana dengan kurungan paling lama tiga bulan kurungan atau denda paling banyak Rp 750.000.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "6. Aturan pemakaian Helm Standar Nasional Indonesia (SNI)", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nPemerintah memberlakukan kewajiban mengenakan helm dengan Standar Nasional Indonesia (SNI) bagi pengemudi motor maupun penumpangnya. Hal ini diatur dalam Undang-undang Republik Indonesia Nomor 22 Tahun 2009, Tentang Lalu Lintas dan Angkutan Jalan Pasal 57 ayat 2 dan Pasal 106 ayat 8. Sanksi bagi pelanggarnya, disebutkan pada pasal 291 undang-undang yang sama, yaitu pidana kurungan paling lama satu bulan atau denda paling banyak Rp 250.000.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),
              
              SelectableText(
                "7. Pemberian tanda lampu isyarat saat berbelok", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nUndang-Undang Nomor 22 Tahun 2009 tentang Lalu Lintas dan Angkutan Jalan, pasal 112 ayat 1 menyebutkan,bahwa setiap pengendara yang akan membelok atau berbalik arah, diwajibkan memberikan isyarat dengan lampu penunjuk arah atau isyarat tangan. Jika melanggar ketentuan ini, Pasal 284 telah mencantumkan sanksinya, yaitu hukuman kurungan paling banyak satu bulan atau denda sebesar Rp 250.000,00.\n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "8. Pelat nomor kendaraan harus terpasang ", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nTercantum dalam Undang-Undang Nomor 22 Tahun 2009 tentang Lalu Lintas Dan Angkutan Jalan pasal 68 ayat 1, yang berbunyi: \"Setiap Kendaraan Bermotor yang dioperasikan di Jalan wajib dilengkapi dengan Surat Tanda Nomor Kendaraan Bermotor dan Tanda Nomor Kendaraan Bermotor.\" Dalam undang-undang tersebut juga disiapkan pula sanksi bagi pelanggarnya yang tertera pada pasal 280, yaitu pidana kurungan paling lama 2 (dua) bulan atau denda paling banyak Rp 500.000,00 (lima ratus ribu rupiah). \n\n",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "9. Pasang Sabuk Pengaman Saat Mengendarai Mobil ", style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 247, 190, 121), height: 1.5),
              ),

              SelectableText(
                 "\nPeraturannya termaktub dalam Undang-undang Republik Indonesia Nomor 22 Tahun 2009, Tentang Lalu Lintas dan Angkutan Jalan Pasal 106 ayat 6. Sanksi yang dijatuhkan apabila seseorang tidak mengenakannya, juga dicantumkan pada pasal 289. Para pelanggarnya bisa dipidana kurungan paling lama 1 (satu) bulan atau denda paling banyak Rp 250.000,00 (dua ratus lima puluh ribu rupiah).\n\n" + "Fitur Informasi juga berisi dasar hukum Undang-Undang Lalu Lintas, diantaranya :\n\n" + "1.1  UU No.22 Tahun 2009 ttg Lalu Lintas dan Angkutan Jalan.\n\n" +"1.2  UU No.23 Tahun 2007 ttg Perkeretaapian.\n\n" + "1.3  PP No 37 Tahun 2017 tentang Keselamatan Lalu Lintas dan Angkutan Jalan.\n\n" + "1.4  PP No 6 Tahun 2017 tentang Perubahan alas PP No.56 Tahun 2009 ttg Penyelenggaraan Perkeretaapian.\n\n" + "1.5  Permenhub No PM 96 Tahun 2015 ttg Pedoman Pelaksanaan Kegiatan Manajemen dan Rekayasa Lalu Lintas.\n\n" + "1.6  Permenhub No.PM 36 Tahun 2011 ttg Perpotongan dan/atau Persinggungan antara Jalur KA dgn Bangunan lain.\n\n" + "1.7  Permenhub No. PM 67 Tahun 2018 ttg Marka Jalan.\n\n" + "1.8  Permenhub No. PM 49 Tahun 2014 ttg APILL (Alat Pemberi Isyarat LaluLintas).\n\n" + "1.9  Peraturan Dirjen Perhubungan Darat No.SK 770/KA 401/DRJD/20 tentang Pedoman Teknis Perlintasan Sebidang Antara Jalan dengan Kereta Api.\n\n", 
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                "Selain Dasar-dasar aturan berlalu lintas yang perlu diketahui Dasar Hukum  yaitu, diantaranya sebagai berikut:",
              style: TextStyle(fontFamily:"Oceanwide",color: Colors.white),
              ),

              SelectableText(
                 "\n1. UU No.22 Tahun 2009 tentang Lalu Lintas dan Angkutan Jalan.\n\n" +"2. UU No.23 Tahun 2007 tentang Perkeretaapian.\n\n" + "3. PP No 37 Tahun 2017 tentang Keselamatan Lalu Lintas dan Angkutan Jalan.\n\n" + "4. PP No 6 Tahun 2017 tentang Perubahan atas PP No.56 Tahun 2009 tentang  Penyelenggaraan Perkerelaapian.\n\n" + "5. Permenhub No PM 96 Tahun 2015 tentang Pedoman Pelaksanaan Kegiatan Manajemen dan Rekayasa Lalu Lintas.\n\n" +"6. Permenhub No.PM 36 Tahun 2011 tentang Perpotongan dan/atau Persinggungan antara Jalur KA dgn Bangunan lain\n\n" + "7. Permenhub No. PM 67 Tahun 2018 tentang Marka Jalan\n\n" + "8. Permenhub No. PM 49 Tahun 2014 tentang APILL (Alat Pemberi Isyarat LaluLintas)\n\n" + "9. Peraturan Dirjen Perhubungan Darat No.SK 770/KA 401/DRJD/20\n\n" + "10. Tentang Pedoman Teknis Perlintasan Sebidang Antara Jalan dengan Kereta Api.\n\n", 
              style: TextStyle(color: Colors.white,fontFamily:"Oceanwide"),
              ),
            InkWell(
              onTap: () {
                _launchUrl("https://kumparan.com/kumparannews/9-aturan-berlalu-lintas-yang-perlu-kamu-ketahui".trim().toLowerCase());
              },
              child: Text("\nSUMBER : kumparanNews. 2017. “9 Aturan Berlalu Lintas yang Perlu Kamu Ketahui”," + "\nhttps://kumparan.com/kumparannews/9-aturan-berlalu-lintas-yang-perlu-kamu-ketahui" + "\n(24 Juli 2022 pukul 22.00)\n\n",style: TextStyle(fontFamily:"Oceanwide",color: Color.fromARGB(255, 255, 186, 181)),)
            ),  
            ],
            )       
              ),
            ],
          )
        ),
        ),

    );
  }


  Future<void> _launchUrl(String urlString) async {
    if(await canLaunchUrlString(urlString)) {
      await launchUrlString(
        urlString,
        //forceWebView: true,
      );
    } else {
      print("Can\'t Launch Url");
    }
  }
  
}