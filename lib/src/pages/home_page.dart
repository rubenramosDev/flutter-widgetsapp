import 'package:flutter/material.dart';
import 'package:primera_aplicacion_funcional/src/pages/alert_page.dart';
import 'package:primera_aplicacion_funcional/src/providers/menu_provider.dart';
import 'package:primera_aplicacion_funcional/src/utils/icono_string_util.dart';

//Scaffold
class HomePage extends StatelessWidget {
  final secciones = ['Primera Seccion', 'Segunda seccion'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes - Primera aplicaciones'),
        centerTitle: true,
        elevation: 9.0,
      ),
      body: _generateListView(),
    );
  }
}

//Scaffold-Body(ListView)
Widget _generateListView() {
  //Data Service-Manejando promesas (Future)
  /*Se maneja un futureBuilder, para que el ListView se cree hasta que se
  resivan los datos de una fuente externa, por ejemplo, un HttpRequest */
  return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listViewModelItems(snapshot.data, context),
        );
      });
}

//Scaffold-Body(ListView/ListViewModelItems)
List<Widget> _listViewModelItems(List<dynamic> data, BuildContext context) {
  final _iconColor = Colors.blue;
  
  return data.map((item) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(item['texto']),
          subtitle: Text('Subtitulo'),
          leading: iconUtil.getIcon(item['icon'], 'grey'),
          trailing: Icon(Icons.keyboard_arrow_right, color: _iconColor),
          onTap: () {
            /* Una forma de navegar a otras ventanas
           final route = MaterialPageRoute(builder: (context) {
              return AlertPage();
            });
            Navigator.push(context, route);*/

            Navigator.pushNamed(context, item['ruta']);
          },
          onLongPress: () {},
        ),
        Divider(),
      ],
    );
  }).toList();
}
