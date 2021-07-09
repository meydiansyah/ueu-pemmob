import 'package:flutter/material.dart';

class Segitiga extends StatefulWidget {
  @override
  _SegitigaState createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  int a = 0, t = 0, b = 0, c = 0;
  TextEditingController alas = new TextEditingController();
  TextEditingController tinggi = new TextEditingController();
  TextEditingController sisiB = new TextEditingController();
  TextEditingController sisiC = new TextEditingController();

  int keliling() {
    int hasil = a + b + c;
    return hasil;
  }

  double luas() {
    double hasil = 0.5 * (a * t);
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
                    controller: sisiB,
                    decoration: InputDecoration(
                      labelText: 'Sisi B',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            b = 0;
                            sisiB.clear();
                          });
                        },
                      ),
                    ),
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: sisiC,
                    decoration: InputDecoration(
                      labelText: 'Sisi C',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            c = 0;
                            sisiC.clear();
                          });
                        },
                      ),
                    ),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          c = int.parse(val);
                        });
                      } else {
                        setState(() {
                          c = 0;
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
                      ),
                    ),
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
                          ]),
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
