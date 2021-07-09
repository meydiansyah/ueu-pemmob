import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListCart extends StatefulWidget {
  @override
  _ListCartState createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  ScrollController scrollController = ScrollController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int tapIndex;

  String total() {
    int val = 0;
    for (int i = 0; i < keyProduct.currentState.listCartProduct.length; i++)
      val += int.parse(keyProduct.currentState.listCartProduct[i].price);

    return val.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(),
      body: keyProduct.currentState.listCartProduct.isEmpty
          ? Center(child: Text("Cart is empty!"))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: scrollController,
                    thickness: 8,
                    radius: Radius.circular(8),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: keyProduct.currentState.listCartProduct
                              .asMap()
                              .entries
                              .map(
                                (e) => listCard(
                                  e.key,
                                  title: e.value.name,
                                  desc: e.value.description,
                                  price: e.value.price,
                                  imgUrl: e.value.image,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  color: Colors.green.shade400,
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Total : ',
                          ),
                          TextSpan(
                            text: '\$${total()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        "List Cart",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.all(5),
        child: Material(
          type: MaterialType.transparency,
          child: Tooltip(
            message: 'Kembali',
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
  }

  Widget listCard(
    int i, {
    String title,
    String desc,
    String price,
    String imgUrl,
  }) {
    return Column(
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
                color: Colors.blue[800].withOpacity(tapIndex == i ? .8 : .2),
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
                    onTap: () => setState(() => tapIndex = i),
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
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: tapIndex == i
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  desc,
                                  style: TextStyle(
                                    color: tapIndex == i
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                  child: Text(
                    "\$ " + price,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: tapIndex == i ? Colors.white : Colors.green,
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
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      bool hapus = true;
                      // ignore: deprecated_member_use
                      scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text('Menghapus data . . .'),
                          duration: Duration(milliseconds: 2500),
                          action: SnackBarAction(
                            label: 'Batal',
                            onPressed: () => hapus = false,
                          ),
                        ),
                      );

                      Future.delayed(Duration(milliseconds: 2500), () {
                        if (hapus) {
                          keyProduct.currentState.listCartProduct.removeAt(i);
                          Fluttertoast.showToast(
                            msg: "Data berhasil dihapus",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            fontSize: 16.0,
                          );
                          setState(() {});
                        }
                      });
                    },
                    label: Text("Remove from cart"),
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
    );
  }
}
