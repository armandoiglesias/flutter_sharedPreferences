import 'package:preferences_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



class PreferenciasUsuario{
  
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs; //= SharedPreferences.getInstance();

  initPrefs() async{
    _prefs= await SharedPreferences.getInstance();  
  }

  get genero{
    return _prefs.getInt("gender") ?? 1;
  }

  set genero(value){
    _prefs.setInt("gender", value);
  }

  get colorSecundario{
    return _prefs.getBool("colorSecundario") ?? false;
  }

  set colorSecundario(bool value){
    _prefs.setBool("colorSecundario", value);
  }

  get nombre{
    return _prefs.getString("nombreusuario") ?? "";
  }

  set nombre(String value) {
    _prefs.setString("nombreusuario", value);
  }

  get ultimaPagina{
    return _prefs.getString("ultimaPagina") ?? HomePage.routeName ;
  }

  set ultimaPagina(String value) {
    _prefs.setString("ultimaPagina", value);
  }
  
}