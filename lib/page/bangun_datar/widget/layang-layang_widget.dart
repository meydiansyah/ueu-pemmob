import 'package:flutter/material.dart';

class Layang extends StatefulWidget {
  @override
  _LayangState createState() => _LayangState();
}

class _LayangState extends State<Layang> {
  int a = 0, b = 0, c = 0, d = 0;

  int d1 = 0, d2 = 0;

  TextEditingController sisiA = new TextEditingController();
  TextEditingController sisiB = new TextEditingController();
  TextEditingController sisiC = new TextEditingController();
  TextEditingController sisiD = new TextEditingController();

  TextEditingController diagonal1 = new TextEditingController();
  TextEditingController diagonal2 = new TextEditingController();

  int keliling() {
    int hasil = a + b + c + d;
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
        children: [
          _sisi(),
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

  Widget _sisi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                          )),
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
                      )),
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
