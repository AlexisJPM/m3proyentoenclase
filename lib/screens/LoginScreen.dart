import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

        ElevatedButton.icon(
          onPressed: ()=>(),
          label: Text("Login"),
          icon: Icon(Icons.login_sharp))
      ],
    )
  );
}