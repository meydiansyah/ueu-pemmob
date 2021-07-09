import 'package:flutter/material.dart';

class Persegi extends StatefulWidget {
  @override
  _PersegiState createState() => _PersegiState();
}

class _PersegiState extends State<Persegi> {
  int sisi = 0;
  TextEditingController persegi = new TextEditingController();

  int keliling() {
    int hasil = 4 * sisi;
    return hasil;
  }

  int luas() {
    int hasil = sisi * sisi;
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
              controller: persegi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Sisi',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        sisi = 0;
                        persegi.clear();
                      });
                    },
                  )),
              onChanged: (String val) {
                if (val.length != 0) {
                  setState(() {
                    sisi = int.parse(val);
                  });
                } else {
                  setState(() {
                    sisi = 0;
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
