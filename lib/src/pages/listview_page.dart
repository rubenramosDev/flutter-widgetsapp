import 'package:flutter/material.dart';

/*El listview.builder se utiliza cuando no sabes cuantos
elementos vamos a estar cargando en la lista o si queremos
hacer un infinite listview o paginacion*/

class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List<int> _listaNumero = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemCount: _listaNumero.length,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumero[index];

        return FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image:
                NetworkImage('https://i.picsum.photos/id/$imagen/800/500.jpg'));
      },
    );
  }
}
