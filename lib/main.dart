import 'package:flutter/material.dart';
import 'package:preferences_app/src/pages/home_page.dart';
import 'package:preferences_app/src/pages/setting_page.dart';
import 'package:preferences_app/src/shared_prefs/preferencias_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());

} 
 
class MyApp extends StatelessWidget {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName : (_) => HomePage(),
        SettingPage.routeName : (_) => SettingPage()
      },
      
    );
  }
}