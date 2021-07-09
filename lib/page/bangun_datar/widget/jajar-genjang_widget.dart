import 'package:flutter/material.dart';

class JajarGenjang extends StatefulWidget {
  @override
  _JajarGenjangState createState() => _JajarGenjangState();
}

class _JajarGenjangState extends State<JajarGenjang> {
  int a = 0, t = 0, b = 0;
  TextEditingController alas = new TextEditingController();
  TextEditingController tinggi = new TextEditingController();
  TextEditingController sisi = new TextEditingController();

  int keliling() {
    int hasil = 2 * (a + b);
    return hasil;
  }

  int luas() {
    int hasil = a * t;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: alas,
                    decoration: InputDecoration(
                        labelText: 'Alas',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              a = 0;
                              alas.clear();
                            });
                          },
                        )),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          a = int.parse(val);
                        });
                      } else {
                        setState(() {
                          a = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sisi,
                    decoration: InputDecoration(
                        labelText: 'Sisi',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              b = 0;
                              sisi.clear();
                            });
                          },
                        )),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          b = int.parse(val);
                        });
                      } else {
                        setState(() {
                          b = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tinggi,
                    decoration: InputDecoration(
                        labelText: 'Tinggi',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              t = 0;
                              tinggi.clear();
                            });
                          },
                        )),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          t = int.parse(val);
                        });
                      } else {
                        setState(() {
                          t = 0;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      "Luas",
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: luas().toString(),
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: ' cm',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      "Keliling",
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: keliling().toString(),
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                            text: ' cm',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
