import 'dart:convert';

import 'package:flutter/services.dart';

class _TasksProvider {
  List<dynamic> tareas = [];

  _TasksProvider() {
    cargarTareas();
  }

  Future<List<dynamic>> cargarTareas() async {
    final resp = await rootBundle.loadString('data/tasks.json');

    Map dataMap = json.decode(resp);
    tareas = dataMap['tareas'];
    return tareas;
  }
}

final tasksProvider = new _TasksProvider();
