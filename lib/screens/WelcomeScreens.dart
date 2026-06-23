import 'package:flutter/material.dart';

class Welcomescreens extends StatelessWidget {
  const Welcomescreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.amberAccent,

        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://4kwallpapers.com/images/walls/thumbs_ev/26605.jpg"),
          fit: BoxFit.cover
          ),
        ),

        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage(""))
        // ),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
        
            FilledButton(onPressed: ()=>Navigator.pushNamed(context, "/login"),
             child: Text("Login")),
        
            ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, "/registro"),
             child: Text("Registro"))
        
        
          ],),
        ),
      ),
    );
  }
}