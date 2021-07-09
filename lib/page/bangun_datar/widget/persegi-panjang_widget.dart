import 'package:flutter/material.dart';

class PersegiPanjang extends StatefulWidget {
  @override
  _PersegiPanjangState createState() => _PersegiPanjangState();
}

class _PersegiPanjangState extends State<PersegiPanjang> {
  int p = 0, l = 0;
  TextEditingController panjang = new TextEditingController();
  TextEditingController lebar = new TextEditingController();

  int keliling() {
    int hasil = 2 * (p + l);
    return hasil;
  }

  int luas() {
    int hasil = p * l;
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
                    controller: panjang,
                    decoration: InputDecoration(
                        labelText: 'Panjang',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              p = 0;
                              panjang.clear();
                            });
                          },
                        )),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          p = int.parse(val);
                        });
                      } else {
                        setState(() {
                          p = 0;
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
                    controller: lebar,
                    decoration: InputDecoration(
                      labelText: 'Lebar',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            l = 0;
                            lebar.clear();
                          });
                        },
                      ),
                    ),
                    onChanged: (String val) {
                      if (val.length != 0) {
                        setState(() {
                          l = int.parse(val);
                        });
                      } else {
                        setState(() {
                          l = 0;
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
