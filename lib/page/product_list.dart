import 'package:flutter/material.dart';
import 'package:flutter_app/model/product.dart';
import 'package:flutter_app/page/cart.dart';
import 'package:flutter_app/page/product_detail.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductPage extends StatefulWidget {
  ProductPage({@required Key key}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  int tapIndex;
  List<ProductModel> _listCartProduct = [];
  List<ProductModel> get listCartProduct => _listCartProduct;

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2800,
      ),
    );
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Scrollbar(
        controller: scrollController,
        thickness: 8,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: Product()
                  .listProduct
                  .asMap()
                  .entries
                  .map(
                    (e) => listCard(
                      e.key,
                      model: e.value,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      centerTitle: true,
      elevation: 0.0,
      leading: Hero(
        tag: 'hero-back-button',
        child: Material(
          type: MaterialType.transparency,
          child: BackButton(),
        ),
      ),
      backgroundColor: Colors.white,
      title: Text(
        "Product Listing",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Material(
            type: MaterialType.transparency,
            child: Tooltip(
              message: 'Cart',
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListCart(),
                  ),
                ),
                borderRadius: BorderRadius.circular(100),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget listCard(
    int i, {
    ProductModel model,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Opacity(
        opacity: animation.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: tapIndex == i ? Colors.blue : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.blue[800].withOpacity(tapIndex == i ? .8 : .2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onLongPress: () => setState(() => tapIndex = i),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProduct(i),
                          ),
                        ),
                        splashColor: Colors.blue.withOpacity(.5),
                        highlightColor: Colors.blue[800].withOpacity(.3),
                        borderRadius: BorderRadius.circular(5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                child: Hero(
                                  tag: 'hero-${model.image}',
                                  child: Image.asset(
                                    model.image,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Hero(
                                      tag: 'hero-${model.name}',
                                      child: Text(
                                        model.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: tapIndex == i
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Hero(
                                      tag: 'hero-${model.description}',
                                      child: Text(
                                        model.description,
                                        style: TextStyle(
                                          color: tapIndex == i
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: tapIndex == i ? Colors.blue : Colors.white,
                      ),
                      child: Hero(
                        tag: 'hero-${model.price}',
                        child: Text(
                          "\$ " + model.price,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: tapIndex == i ? Colors.white : Colors.green,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Offstage(
              offstage: tapIndex == i ? false : true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
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
                          setState(() => _listCartProduct.add(model));
                        },
                        label: Text("Add to cart"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () => setState(() => tapIndex = null),
                        child: Icon(Icons.close),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
