import 'package:app12/main.dart';
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

Future<List<dynamic>> leerSupa () async {
  final data = await supabase
  .from('auto')
  .select();

  return data;

}

Widget lista (){
  return FutureBuilder(future: leerSupa(), builder:(context, snapshot) {

    if(snapshot.connectionState == ConnectionState.waiting){

      return CircularProgressIndicator();

    }

    if(snapshot.hasError){

    }

    if(snapshot.hasData){

      final data = snapshot.data!;
      return ListView.builder(itemCount: data.length, itemBuilder:(context, index) {
        final auto = data[index];

        return ListTile(
          title: Text(auto['placa']),

          trailing: IconButton(onPressed: ()=>(), icon: Icon(Icons.delete)),
        );
      },);

    }else{
      return Text("Error");
    }
  },);
}



Future<void> eliminar(placa) async {

  showDialog(context: context, builder:(context) => 
  AlertDialog(
    title: Text("Advertencia"),
    content: Text("Estas por borrar un itrms"),
    actions: [
      FilledButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancelar")),
      OutlinedButton(onPressed:() async {
        await supabase.from('auto').delete().eq('placa', placa);
        Navigator.pop(context);
      },
      child: Text("Borrar"))
    ],
  )
  ,);
await supabase
  .from('auto')
  .delete()
  .eq('placa', placa);

}