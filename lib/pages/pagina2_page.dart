import 'package:flutter/material.dart';


class Pagina2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child:Text('Establecer Usuario', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){

              } 
            ),
            MaterialButton(
              child:Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){

              } 
            ),
            MaterialButton(
              child:Text('Añadir Profesion', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){

              } 
            ),
          ],
        )
     ),
   );
  }
}