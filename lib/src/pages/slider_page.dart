import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bandera = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _creaSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _creaSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamanio de la imagen',
      value: _valorSlider,
      //divisions: 50,
      min: 10.0,
      max: 400.0,
      //Se evalua si el checkbox esta habilitado para llamar a la funciono o no
      onChanged: (_bandera)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

 

  Widget _crearCheckBox() {
    /* Un ejemplo de checkbox mas basico
    return Checkbox(
      value: _bandera,
      onChanged: (valor) {
        setState(() {
          _bandera = valor;
        });
      },
    );*/
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bandera,
      onChanged: (valor) {
        setState(() {
          _bandera = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bandera,
      onChanged: (valor) {
        setState(() {
          _bandera = valor;
        });
      },
    );
  }

   Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://lh3.googleusercontent.com/proxy/yGQS8wZ_hpMaTwLU1_4uRpeCDHZ_3pL1c3SfsSae6KviH2ohu3fAK2dpNA6J_yU4_ueC6TEYD4WVqCbflU3jVL81ps2RmciqN9FAgFP-UAcRWT3kgw'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
