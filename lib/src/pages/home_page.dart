
import 'package:flutter/material.dart';
import 'package:preferences_app/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferences_app/src/widget/menu.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";
  final preferencias = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    preferencias.ultimaPagina = routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
        backgroundColor: preferencias.colorSecundario ? Colors.teal : Colors.blue ,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color Secundario ${ preferencias.colorSecundario} "),
          Divider(),
          Text("Genero ${ preferencias.genero }"),
          Divider(),
          Text("Nombre ${ preferencias.nombre }"),
          Divider(),
        ],
      ),
    );
  }

  
}
