import 'package:flutter/material.dart';

class Trapesium extends StatefulWidget {
  @override
  _TrapesiumState createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  int a = 0, b = 0, c = 0, d = 0;

  int t = 0;

  TextEditingController sisiA = new TextEditingController();
  TextEditingController sisiB = new TextEditingController();
  TextEditingController sisiC = new TextEditingController();
  TextEditingController sisiD = new TextEditingController();

  TextEditingController tinggi = new TextEditingController();

  int keliling() {
    int hasil = a + b + c + d;
    return hasil;
  }

  double luas() {
    double hasil = ((a + b) / 2) * t;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sisi(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tinggi",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
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
              onChanged: (String value) {
                if (value.length != 0) {
                  setState(() {
                    t = int.parse(value);
                  });
                } else {
                  setState(() {
                    t = 0;
                  });
                }
              },
            ),
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
                          ]),
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

  Widget _sisi() {
    return Column(
      children: [
        Text(
          "Sisi",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: sisiA,
                      decoration: InputDecoration(
                        labelText: 'Sisi A',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              a = 0;
                              sisiA.clear();
                            });
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        if (value.length != 0) {
                          setState(() {
                            a = int.parse(value);
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
                      onChanged: (String value) {
                        if (value.length != 0) {
                          setState(() {
                            b = int.parse(value);
                          });
                        } else {
                          setState(() {
                            b = 0;
                          });
                        }
                      },
                    ),
                  ),
                )
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
                      onChanged: (String value) {
                        if (value.length != 0) {
                          setState(() {
                            c = int.parse(value);
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
                      controller: sisiD,
                      decoration: InputDecoration(
                        labelText: 'Sisi D',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              d = 0;
                              sisiD.clear();
                            });
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        if (value.length != 0) {
                          setState(() {
                            d = int.parse(value);
                          });
                        } else {
                          setState(() {
                            d = 0;
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
