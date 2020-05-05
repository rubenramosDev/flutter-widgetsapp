import 'package:flutter/material.dart';

class CargPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
          _cardType1(),
          SizedBox(height: 5.0),
          _cardType2(),
          SizedBox(height: 45.0),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo, color: Colors.blue),
            title: Text('Titulo de la terjeta'),
            subtitle: Text('lorem'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text('Continuar')),
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
    final card = 
  Container(
        child: Column(
      children: <Widget>[
        FadeInImage(
            image: NetworkImage('https://wallpaperaccess.com/full/903543.jpg'),
            placeholder: AssetImage('assets/images/loading.gif'),
            fadeInDuration: Duration(milliseconds: 900),
            fit: BoxFit.cover),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Landscape'),
        ),
      ],
    ));

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 1.5,
                offset: Offset(5.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: card,
      ),
    );
  }
}
