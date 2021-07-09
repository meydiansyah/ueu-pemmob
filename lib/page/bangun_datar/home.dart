import 'package:flutter/material.dart';
import 'package:flutter_app/page/bangun_datar/widget/belah-ketupat_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/jajar-genjang_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/layang-layang_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/lingkaran_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/persegi-panjang_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/persegi_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/segitiga_widget.dart';
import 'package:flutter_app/page/bangun_datar/widget/trapesium_widget.dart';

class BangunDatarPage extends StatefulWidget {
  @override
  _BangunDatarPageState createState() => _BangunDatarPageState();
}

class _BangunDatarPageState extends State<BangunDatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: false,
            expandedHeight: MediaQuery.of(context).size.height / 3.5,
            leading: Container(),
            backgroundColor: Colors.green,
            actions: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Material(
                  type: MaterialType.transparency,
                  child: Tooltip(
                    message: 'Kembali',
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hitung Bangun Ruang"),
              background: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 50,
                      child: Container(
                        height: 80,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white24,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 60,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: Colors.white24,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Pilih bangun ruang untuk menentukan keliling dan luas bangunan",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                ExpansionTile(
                  title: Text("Persegi"),
                  children: [
                    Persegi(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Persegi Panjang"),
                  children: [
                    PersegiPanjang(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Jajar Genjang"),
                  children: [
                    JajarGenjang(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Segitiga"),
                  children: [
                    Segitiga(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Belah Ketupat"),
                  children: [
                    BelahKetupat(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Layang Layang"),
                  children: [
                    Layang(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Trapesium"),
                  children: [
                    Trapesium(),
                  ],
                ),
                ExpansionTile(
                  title: Text("Lingkaran"),
                  children: [
                    Lingkaran(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
