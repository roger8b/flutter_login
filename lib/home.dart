library flutter_login.routing.home;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login/generated/i18n.dart';
import 'package:flutter_login/utils/util_text_style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      locale: Locale("en", ""),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Home Page',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Welcome Home',
            ),
          ),
          body: new Container(
            padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
            child: ListView(
              children: <Widget>[
                new Center(
                  child: Text(
                    S.of(context).home_message,
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                new SizedBox(height: 34.0),
                new RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: UtilTextStyle.buttonLabel(S.of(context).home_button_label) /*buildText(S.of(context).home_button_label)*/,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login');
                  },
                )
              ],
            ),
          )),
    );
  }

}
