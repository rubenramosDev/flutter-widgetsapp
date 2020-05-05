import 'package:flutter/material.dart';
import 'package:primera_aplicacion_funcional/src/pages/alert_page.dart';
import 'package:primera_aplicacion_funcional/src/routes/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

//Main-MaterialApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primera aplicacion funcional',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: routesProvider.routesGenerator(),
      /*Funcion que maneja un ruta por defecto cuando no esta mappeada*/
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('es', 'ES'), const Locale('en', 'US')],
    );
  }
}
