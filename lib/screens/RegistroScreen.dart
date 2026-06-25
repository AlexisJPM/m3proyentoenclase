import 'package:app12/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(width: 300, child: formulario(context))),
    );
  }
}

Widget formulario(context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();

  return (Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(controller: correo),
      TextField(controller: contrasenia, obscureText: true),
      TextField(controller: nick),

      ElevatedButton.icon(
        onPressed: () => registro(context, correo, contrasenia),
        label: Text("Registro"),
        icon: Image.asset("assets/icons/registro.png", width: 30),
      ),
    ],
  ));
}

Future<void> registro(context, correo, contrasenia) async {
  final AuthResponse res = await supabase.auth.signUp(
    email: correo.text,
    password: contrasenia.text,
  );
  final Session? session = res.session;
  final User? user = res.user;

  Navigator.pushNamed(context, "/login");
}
