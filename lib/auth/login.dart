library flutter_login.routing.auth.login;

import 'package:flutter/material.dart';
import 'package:flutter_login/generated/i18n.dart';
import 'package:flutter_login/utils/util_text_style.dart';
import 'package:validate/validate.dart';

class _LoginData {
  String email = '';
  String password = '';
}

class LoginPage extends StatefulWidget {
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginData _data = new _LoginData();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final email = new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onSaved: (String value) {
        this._data.email = value;
      },
      decoration: InputDecoration(hintText: S.of(context).email),
      validator: this._validateEmail,
    );

    final password = new TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (String value) {
        this._data.password = value;
      },
      decoration: InputDecoration(hintText: S.of(context).password),
      validator: this._validatePassword,
    );

    final logo = Image.asset(
      'images/flutter.png',
      fit: BoxFit.contain,
      height: 160.0,
    );

    final signupButton = RaisedButton(
      color: Colors.lightBlueAccent,
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: UtilTextStyle.buttonLabel(S.of(context).login),
      onPressed: () {
        if(_formKey.currentState.validate()){
          this.submit(context);
        }
      },
    );

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
          body: new Center(
            child: new Form(
                key: _formKey,
                child: new ListView(
                  padding: EdgeInsets.only(top: 80.0, left: 24.0, right: 24.0),
                  children: <Widget>[
                    logo,
                    SizedBox(
                      height: 48.0,
                    ),
                    email,
                    SizedBox(
                      height: 16.0,
                    ),
                    password,
                    SizedBox(
                      height: 16.0,
                    ),
                    signupButton,
                  ],
                )),
          )),
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.popAndPushNamed(context, '/');

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
    }
  }

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return S.of(context).invalid_email_message;
    }

    return null;
  }

  String _validatePassword(String value){
    if(value.length < 6){
      return S.of(context).short_password_message;
    }

    return null;
  }
}
