import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('Texto'),
        elevation: 5.0,
        textColor: Colors.white,
        color: Colors.blue,
        shape: StadiumBorder(),
        onPressed: () => _generadorAlerta(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _generadorAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la alerta'),
              FlutterLogo(
                size: 120.0,
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Siguiente'),
            ),
          ],
        );
      },
    );
  }
}
