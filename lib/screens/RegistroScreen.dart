import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: correo.text,
          password: contrasenia.text,
        );
    Navigator.pushNamed(context, "/guardar");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      //print('The password provided is too weak.');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.code),
          content: Text(e.message.toString()),
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
