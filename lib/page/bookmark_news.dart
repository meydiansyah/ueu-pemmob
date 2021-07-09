import 'package:flutter/material.dart';
import 'package:flutter_app/helper/bookmark_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/news.dart';
import '../model/news.dart';
import 'webview.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  BookmarkController controller;

  @override
  void initState() {
    controller = BookmarkController.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmark",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<List<SavedNews>>(
        stream: Stream.fromFuture(controller.getBookmark()),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              backgroundColor: Colors.grey,
              minHeight: 2,
            );
          else {
            if (snapshot.data.isEmpty) {
              return Center(
                child: Text("Data Kosong !"),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:
                        snapshot.data.map((e) => _expansionTile(e)).toList(),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }

  Padding _expansionTile(SavedNews e) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        title: Text(
          e.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: SizedBox(
          height: 80,
          width: 100,
          child: e.urlImage != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      e.urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Icon(Icons.image_not_supported),
                    Text(
                      "Not found",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () async => await controller.removeBookmark(e.id).then(
                (value) => Fluttertoast.showToast(
                  msg: "Data berhasil dihapus",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.SNACKBAR,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  fontSize: 16.0,
                ).then((value) => setState(() {})),
              ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(
                          url: e.url,
                          title: e.title,
                        ),
                      )),
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.open_in_new),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Lainnya",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
