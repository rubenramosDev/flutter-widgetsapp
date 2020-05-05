import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = 'Developper';

  List<String> _puesto = ['Developper', 'Manager', 'CEO', 'Database Manager'];
  
  //Esta opcion debe estar dentro del arreglo que se usara en el combo box
  String _opcionesSeleccionada = 'Manager';


  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body:
          //Se coloca un ListView para poder hacer scroll
          ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _creaInput(),
          Divider(),
          _creaInputEmail(),
          Divider(),
          _passwordInputEmail(),
          Divider(),
          _inputFecha(context),
          Divider(),
          _inputDropDown(),
          Divider(),
          _mostrarNombre(),
        ],
      ),
    );
  }

  Widget _creaInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras: ${_nombre.length} / 20'),
          hintText: 'Ruben Ramos, Rosalba Vazquez, etc...',
          labelText: 'Nombre',
          helperText: 'Nombre Completo',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (valor) {
        //Se redibuja el widget por cada letra que se escriba
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _creaInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'ejemplo@direccion.com',
          labelText: 'Email',
          helperText: 'Correo electronico valido',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.alternate_email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _passwordInputEmail() {
    return TextField(
      obscureText: true,
      enableInteractiveSelection: false,
      autofocus: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: '**********',
          labelText: 'Contrasenia',
          helperText: '10 digitos',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _inputFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: '20/05/1998',
          labelText: 'Fecha de nacimeinto',
          helperText: 'Fecha valida',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_view_day)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> _opcionesDropDrown() {
    List<DropdownMenuItem<String>> lista = new List();

    _puesto.forEach((puesto) {
      lista.add(DropdownMenuItem(
        child: Text(puesto),
        value: puesto,
      ));
    });
    return lista;
  }

  Widget _inputDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
                  child: DropdownButton(
            value: _opcionesSeleccionada,
            items: _opcionesDropDrown(),
            onChanged: (opt) {
              setState(() {
                _opcionesSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
  }

  Widget _mostrarNombre() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('El correo es: $_email'),
      trailing: Text(_opcionesSeleccionada),
    );
  }
}
