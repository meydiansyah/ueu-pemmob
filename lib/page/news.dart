import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/helper/bookmark_helper.dart';
import 'package:flutter_app/model/news.dart';
import 'package:flutter_app/page/bookmark_news.dart';
import 'package:flutter_app/page/webview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var url =
      "https://newsapi.org/v2/top-headlines?country=id&category=technology&apiKey=97fb428247ec44da905fefd97429ed2a";
  BookmarkController bookmarkController;

  Future<News> getNews() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      News news = News.fromJson(json);

      return news;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    bookmarkController = BookmarkController.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "News Page",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_outline),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkPage(),
                )),
          )
        ],
      ),
      body: FutureBuilder<News>(
        future: getNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              backgroundColor: Colors.grey,
              minHeight: 2,
            );
          else {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ...snapshot.data.news.map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: _expansionTile(e),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  ExpansionTile _expansionTile(NewsItem e) {
    return ExpansionTile(
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
        child: e.urlToImage != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    e.urlToImage,
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
          icon: Icon(Icons.bookmark_outline),
          onPressed: () async {
            bookmarkController
                .addBookmark(
                  e.title,
                  e.urlToImage,
                  e.url,
                )
                .then((value) => Fluttertoast.showToast(
                      msg: "Data berhasil disimpan",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blue,
                      fontSize: 16.0,
                    ));
          }),
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              e.description != null
                  ? Text(
                      e.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
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
    );
  }
}
