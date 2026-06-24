import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Leerscreen extends StatelessWidget {
  const Leerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lista(),
    );
  }
}

Future<List<dynamic>> leerFire() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('autos/').get();

  if (snapshot.exists) {
    return snapshot.children.map( (child){
      final data = Map.from(child.value as Map);

      return{
        'placa': child.key,
        'marca': data['marca'],
        'precio':  data["precio"]
      };
    } ).toList();

  } else {
    return[];
  }
}

Widget lista(){
  return FutureBuilder(future: leerFire(), builder:(context, snapshot) {
    if( snapshot.hasData){
      final data =snapshot.data!;

      return ListView.builder(itemCount: data.length, itemBuilder:(context, index) {
        final auto = data[index];

        return ListTile(
          title: Text(auto['placa']),
          
          trailing: IconButton(onPressed: ()=>eliminar(auto['placa']),
           icon: Icon(Icons.delete)),
        );
      },);

    }else{
      return Text("No hay datos");
    }
  },);
}


Future<void> eliminar(placa) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("autos/$placa");

  await ref.remove();

}