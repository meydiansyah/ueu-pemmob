import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/model/product.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailProduct extends StatefulWidget {
  int index;
  DetailProduct(this.index);
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    var product = Product().listProduct[widget.index];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Hero(
          tag: 'hero-back-button',
          child: Material(
            type: MaterialType.transparency,
            child: BackButton(),
          ),
        ),
        title: Hero(
          tag: 'hero-${product.name}',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              product.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Hero(
                  tag: 'hero-${product.image}',
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: 2,
                          color: Colors.black.withOpacity(.5),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Hero(
                tag: 'hero-${product.description}',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Hero(
                tag: 'hero-${product.price}',
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "\$ ${product.price}",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Data berhasil disimpan",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.SNACKBAR,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue,
                    fontSize: 16.0,
                  );
                  setState(() =>
                      keyProduct.currentState.listCartProduct.add(product));
                },
                label: Text("Add to cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
