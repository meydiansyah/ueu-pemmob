import 'package:flutter/material.dart';

class Lingkaran extends StatefulWidget {
  @override
  _LingkaranState createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  int r = 0;
  double phi = 3.14;

  TextEditingController jari = new TextEditingController();

  double keliling() {
    double hasil = 2 * phi * r;
    return hasil;
  }

  double luas() {
    double hasil = phi * r * r;
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: jari,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Jari - Jari',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        r = 0;
                        jari.clear();
                      });
                    },
                  )),
              onChanged: (String val) {
                if (val.length != 0) {
                  setState(() {
                    r = int.parse(val);
                  });
                } else {
                  setState(() {
                    r = 0;
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
}
