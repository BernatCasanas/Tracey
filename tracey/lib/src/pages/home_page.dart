import 'dart:js';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracey"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          RichText(
            text: TextSpan(
                text: "Hola, ",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                children: [
                  TextSpan(
                      text: "Bernat\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Estas son tus tareas para hoy: ")
                ]),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
              child: ListView(
                  padding: EdgeInsets.all(10.0),
                  scrollDirection: Axis.vertical,
                  children: [
                _cardTask(),
              ])),
        ],
      ),
    );
  }

  Widget _cardTask() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        children: [
          ListTile(
            leading: LayoutBuilder(
              builder: (context, constraint) {
                return new Icon(
                  Icons.alarm,
                  color: Colors.blue,
                  size: constraint.biggest.height,
                );
              },
            ),
            title: Text('Título de la tarea'),
            subtitle: Text('13:00 - 15:00'),
          ),
        ],
      ),
    );
  }
}
