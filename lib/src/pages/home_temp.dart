    import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Hey', 'Cinco', 'Nueve mil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String item in opciones) {
      final tempWidget = ListTile(
        title: Text(item),
      );

      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.add_to_home_screen),
            trailing: Icon(Icons.info_outline),
            onTap: () {},
            onLongPress: () {
              print("Hey");
            },
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
