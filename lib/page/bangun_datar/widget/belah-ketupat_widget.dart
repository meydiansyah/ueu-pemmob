import 'package:flutter/material.dart';

class BelahKetupat extends StatefulWidget {
  @override
  _BelahKetupatState createState() => _BelahKetupatState();
}

class _BelahKetupatState extends State<BelahKetupat> {
  int s = 0;

  int d1 = 0, d2 = 0;

  TextEditingController sisi = new TextEditingController();
  TextEditingController diagonal1 = new TextEditingController();
  TextEditingController diagonal2 = new TextEditingController();

  int keliling() {
    int hasil = 4 * s;
    return hasil;
  }

  double luas() {
    double hasil = 0.5 * (d1 * d2);
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sisi",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: sisi,
              decoration: InputDecoration(
                labelText: 'Sisi ( 4 x sisi )',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      s = 0;
                      sisi.clear();
                    });
                  },
                ),
              ),
              onChanged: (String value) {
                if (value.length != 0) {
                  setState(() {
                    s = int.parse(value);
                  });
                } else {
                  setState(() {
                    s = 0;
                  });
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _diagonal(),
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

  Widget _diagonal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Diagonal",
          style: TextStyle(fontSize: 18),
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
                  controller: diagonal1,
                  decoration: InputDecoration(
                      labelText: 'Diagonal 1',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            d1 = 0;
                            diagonal1.clear();
                          });
                        },
                      )),
                  onChanged: (String value) {
                    if (value.length != 0) {
                      setState(() {
                        d1 = int.parse(value);
                      });
                    } else {
                      setState(() {
                        d1 = 0;
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
                  controller: diagonal2,
                  decoration: InputDecoration(
                    labelText: 'Diagonal 2',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          d2 = 0;
                          diagonal2.clear();
                        });
                      },
                    ),
                  ),
                  onChanged: (String value) {
                    if (value.length != 0) {
                      setState(() {
                        d2 = int.parse(value);
                      });
                    } else {
                      setState(() {
                        d2 = 0;
                      });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
