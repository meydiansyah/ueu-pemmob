import 'package:flutter/material.dart';

import 'helper_localization.dart';

class HomeLocalization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              CustomLocalizations.of(context).message,
            ),
          ],
        ),
      ),
    );
  }
}
