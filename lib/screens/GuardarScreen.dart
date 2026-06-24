import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Container(width: 350, child: formularioG(context))),
    );
  }
}

Widget formularioG(context) {
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();

  return (Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(controller: placa),
      TextField(controller: marca),
      TextField(controller: precio),

      FilledButton(onPressed: () => guardar(placa, marca, precio), child: Text("Guardar")),

      ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, "/leer"), child: Text("Leer"),
      )
    ],
  ));
}

////////////////////////////////////////////////////////////
///

Future<void> guardar(placa, marca, precio) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("autos/${placa.text}");

  await ref.set({
    "marca": marca.text,
    "precio": double.parse(precio.text),
  });
}
