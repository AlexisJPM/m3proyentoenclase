import 'package:app12/screens/DetalleScreen.dart';
import 'package:app12/screens/GuardarScreen.dart';
import 'package:app12/screens/LeerScreen.dart';
import 'package:app12/screens/LoginScreen.dart';
import 'package:app12/screens/RegistroScreen.dart';
import 'package:app12/screens/WelcomeScreens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppFire());
}

class AppFire extends StatelessWidget {
  const AppFire({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark(),

      initialRoute: "/guardar",
      
      routes: {
        "/":(context) => Welcomescreens(),
        "/login":(context)=> LoginScreen(),
        "/registro":(context) => Registroscreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => Leerscreen(),
        "/detalle":(context) => Detallescreen() 


        
      },
    );
  }
}
