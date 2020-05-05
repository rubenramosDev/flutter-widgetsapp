import 'dart:async';

import 'package:flutter/material.dart';

class InfiniteScroll extends StatefulWidget {
  @override
  _InfiniteScrollState createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  /*Es un objeto que nos permite tener control del comportamiento
  del scroll. Se asigna el controller cuando se crea el scroll.*/
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumero = new List();
  int _ultimoItem = 0;
  bool isLoading = false;

  /*Este es una evento del ciclo de vida del statfulwidget. Como el onCreate
  en Android.*/
  @override
  void initState() {
    super.initState();
    _agregar10();

    /*Se agrega un listener al scroll para saber cual su maximo de pixeles y
    cuando se llegue a ese maximo, se vuelve a llamar a la agregar, para
    hacer la ilusion de un scroll infinito */
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  /*Cuando se termina de ejecutar la pagina, se debe de llamar al 
  recolector de basura para eliminar el listener, si no, cada vez
  que entremos se agregara uno nuevo y va a generar un consumo de memoria
  */
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumero.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumero[index];

          return FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(
                  'https://i.picsum.photos/id/$imagen/800/500.jpg'));
        },
      ),
      onRefresh: _obtenerPagina,
    );
  }

  Future<Null> _obtenerPagina() async {
    final duration = new Duration(seconds: 3);
    new Timer(duration, () {
      _listaNumero.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }

    setState(() {});
  }

  /*Solamente simula el tiempo de respuesta de una peticion http */
  Future<Null> _fetchData() async {
    isLoading = true;
    final duration = new Duration(seconds: 5);

    setState(() {});

    return new Timer(duration, respuestaHTTP);
  }

  /*Termina el ''tiempo de respuesta'' de http y ya tenemos datos */
  void respuestaHTTP() {
    isLoading = false;
    _agregar10();

    /*Cuando se termina el tiempo de respuesta, a traves
    del scrollcontroller, se hace un scroll de 100 pixeles
    para indicar al usuario que ya se cargaron las demas imagenes.*/
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: new Duration(milliseconds: 250));
  }

  /*Se crea la animacion del circularProgressIndicator.
  Se apila encima del listView con un stack que
  se llama desde el body del scaffold.*/
  Widget _crearLoading() {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      /*Se returna un null ya que el metodo retorna un widget
      si o si.*/
      return Container();
    }
  }
}
