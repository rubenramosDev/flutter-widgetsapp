import 'package:flutter/material.dart';
import 'package:primera_aplicacion_funcional/src/pages/alert_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/avatar_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/card_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/container_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/home_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/infinite_scroll.dart';
import 'package:primera_aplicacion_funcional/src/pages/input_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/listview_page.dart';
import 'package:primera_aplicacion_funcional/src/pages/slider_page.dart';

class _RoutesGenerator {
  Map<String, WidgetBuilder> routesGenerator() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => HomePage(),
      'alert': (BuildContext context) => AlertPage(),
      'avatar': (BuildContext context) => AvatarPage(),
      'card': (BuildContext context) => CargPage(),
      'container': (BuildContext context) => AnimatedContainerPage(),
      'inputs': (BuildContext context) => InputPage(),
      'slider': (BuildContext contex) => SliderPage(),
      'listview': (BuildContext context) => ListViewBuilder(),
      'infinite': (BuildContext context) => InfiniteScroll()
    };
  }
}

final routesProvider = new _RoutesGenerator();
