import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/page/bangun_datar/home.dart';
import 'package:flutter_app/page/news.dart';
import 'package:flutter_app/page/product_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Pemrograman Mobile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.public),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewsPage())),
          )
        ],
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black.withOpacity(.5),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/bin.png'),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Riski Meydiansyah",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Teknik Informatika",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Esa Unggul University",
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Contact person : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                icon: Icon(Icons.phone),
                label: Text("WhatsApp"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () async {
                  var url = "whatsapp://send?phone=+62895621024355";
                  await canLaunch(url)
                      ? launch(url)
                      : Fluttertoast.showToast(
                          msg: "Tekan sekali lagi",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.orange,
                          fontSize: 16.0,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawer() {
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Product List"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    key: keyProduct,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Bangun Datar"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BangunDatarPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
