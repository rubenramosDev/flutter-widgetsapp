import 'package:flutter/material.dart';

class _IconoString {
  final _icons = <String, dynamic>{
    'add_alert': Icons.add_alert,
    'accessibility': Icons.accessibility,
    'folder_open': Icons.folder_open,
    'donut_large': Icons.donut_large,
    'listview': Icons.list,
    'infinite':Icons.all_inclusive,
    'slider': Icons.slideshow,
    'input': Icons.input,
    'blue': Colors.blue,
    'red': Colors.red
  };

  //No se pueden interpolar los valores enviados por parametro :(
  Icon getIcon(String iconName, String color) {
    return Icon(_icons[iconName], color: _icons[color]);
  }
}

final iconUtil = new _IconoString();
