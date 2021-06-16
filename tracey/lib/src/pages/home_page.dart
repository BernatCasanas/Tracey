import 'package:flutter/material.dart';
import 'package:tracey/src/providers/tasks_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracey"),
      ),
      body: Column(children: [
        SizedBox(
          height: 30.0,
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Center(
              child: RichText(
                  text: TextSpan(
            text: "Hola, ",
            style: TextStyle(color: Colors.black, fontSize: 20.0),
            children: [
              TextSpan(
                  text: "Bernat\n",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "Estas son tus tareas para hoy: ")
            ],
          ))),
        ),
        SizedBox(
          height: 30.0,
        ),
        Expanded(child: _cargarTarjetas()),
      ]),
    );
  }

  Widget _cargarTarjetas() {
    List<Widget> lista = [];
    return FutureBuilder(
        future: tasksProvider.cargarTareas(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            padding: EdgeInsets.all(10.0),
            children: _crearListaTareas(snapshot.data, context),
          );
        });
  }

  List<Widget> _crearListaTareas(List<dynamic> data, BuildContext context) {
    final List<Widget> tareas = [];
    data.forEach((tarea) {
      tareas.add(_cardTask(
          titulo: tarea['titulo'],
          horaInicio: tarea['hora_inicio'],
          horaFinal: tarea['hora_fin']));
    });
    return tareas;
  }

  Widget _cardTask({String titulo, String horaInicio, String horaFinal}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
          leading: Icon(
            Icons.access_time,
            color: Colors.blue,
          ),
          title: Text("$titulo"),
          subtitle: Text("$horaInicio - $horaFinal"),
          trailing: Icon(Icons.more_vert)),
    );
  }
}
