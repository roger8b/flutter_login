import 'package:flutter/material.dart';
import 'package:flutter_login/generated/i18n.dart';
import 'package:flutter_login/routing/routing.dart';

void main() => runApp(new App());

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      locale: Locale("en",""),
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/login',
      routes: routes
    );
  }
}

