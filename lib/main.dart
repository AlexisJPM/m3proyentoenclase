import 'package:app12/screens/DetalleScreen.dart';
import 'package:app12/screens/GuardarScreen.dart';
import 'package:app12/screens/LeerScreen.dart';
import 'package:app12/screens/LoginScreen.dart';
import 'package:app12/screens/RegistroScreen.dart';
import 'package:app12/screens/WelcomeScreens.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
   await Supabase.initialize(
    url: 'https://aviadkgwvgjrlwxpclaz.supabase.co',
    publishableKey: 'sb_publishable_k5XNzdoiZmVggYjgIDRnqQ_J1-Gw83S',
  );
  
  runApp(const AppSupa());
}

final supabase = Supabase.instance.client;

class AppSupa extends StatelessWidget {
  const AppSupa({super.key});

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
