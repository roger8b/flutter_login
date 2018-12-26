library flutter_login.routing.auth.login;

import 'package:flutter/material.dart';
import 'package:flutter_login/generated/i18n.dart';
import 'package:flutter_login/utils/util_text_style.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      locale: Locale("en", ""),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Login Page',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Login Page',
            ),
          ),
          body: new Container(
            padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
            child: ListView(
              children: <Widget>[
                new Center(
                  child: Text(
                    S.of(context).login_page_message,
                    style: new TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new SizedBox(height: 34.0,),
                new RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: UtilTextStyle.buttonLabel(S.of(context).login_button_label),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            ),
          )),
    );
  }
}
