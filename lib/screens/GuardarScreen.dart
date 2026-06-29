import 'package:app12/main.dart';
import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 350,
          child: formularioG(context)),
      ),
    );
  }
}

Widget formularioG(context){
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();

  return(
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: placa,
        ),
        TextField(
          controller: marca,
        ),
        TextField(
          controller: precio,
        ),

        FilledButton(
          onPressed: ()=> guardar(placa, marca, precio),
          child: Text("Guardar")),
          ElevatedButton(onPressed:() {
            Navigator.pushNamed(context, "/leer");
          }, child: Text("Leer"))
      ],
    )
  );

}

Future<void> guardar(placa, marca, precio) async {
  try{
  await supabase
    .from('auto')
    .insert(
      {
        'placa': placa.text,
        'marca': marca.text,
        'precio': double.parse(precio.text)
        }
        );
  }catch(e){
    print(e.toString());
  }
        
}