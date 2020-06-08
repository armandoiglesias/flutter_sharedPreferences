import 'package:flutter/material.dart';
import 'package:preferences_app/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferences_app/src/widget/menu.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = "preferences";

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario;
  int _genero ;
  String _nombre;

  TextEditingController _controller;

  final _prefs =  PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    _prefs.ultimaPagina = SettingPage.routeName;
   
    _genero = _prefs.genero;
    _nombre = _prefs.nombre;
    _colorSecundario = _prefs.colorSecundario;
    _controller = TextEditingController(text: _prefs.nombre);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 45.0),
            ),
          ),
          Divider(),
          SwitchListTile(
            title: Text("Color Secundario"),
            value: _colorSecundario,
            onChanged: (value) {
              setState(() {
                _prefs.colorSecundario = value;
                _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedGender,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedGender,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Nombre", helperText: "Nombre de usuario"),
              onChanged: (value) {
                _prefs.nombre = value;
                _nombre = value;
                setState(() {
                  
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedGender(int value) {
    _prefs.genero = value;
    _genero = value;
    setState(() {
      
    });
   
  }

  
}
