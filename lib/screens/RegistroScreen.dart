import 'package:flutter/material.dart';

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: formulario()),
      ),
    );
  }
}
Widget formulario(){
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController nick = TextEditingController();

  return(
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        TextField(
          controller: correo,
        ),
        TextField(
          controller: contrasenia,
          obscureText: true,
        ),
        TextField(
          controller: nick,
        ),

        ElevatedButton.icon(
          onPressed: ()=>(),
          label: Text("Registro"),
          icon: Image.asset("assets/icons/registro.png", width: 30,))
      ],
    )
  );
}