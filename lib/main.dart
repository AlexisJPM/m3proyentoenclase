import 'package:app12/screens/DetalleScreen.dart';
import 'package:app12/screens/GuardarScreen.dart';
import 'package:app12/screens/LeerScreen.dart';
import 'package:app12/screens/LoginScreen.dart';
import 'package:app12/screens/RegistroScreen.dart';
import 'package:app12/screens/WelcomeScreens.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        "/": (context) => Welcomescreens(),
        "/login": (context) => LoginScreen(),
        "/registro": (context) => Registroscreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => Leerscreen(),
        "/detalle": (context) => Detallescreen(),
      },
    );
  }
}
