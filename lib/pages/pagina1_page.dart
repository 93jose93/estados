import 'package:flutter/material.dart';


class Pagina1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 1'),
        centerTitle: true,
      ),
      body: InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_right),
       onPressed: () {
         Navigator.pushNamed(context,  'pagina2');
       },
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        //tome todo el ancho que pueda
        width: double.infinity,     
        //tome todo el alto posible
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            ListTile( title: Text('Nombre: '),),
            ListTile( title: Text('Edad: '),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            ListTile( title: Text('Profesion 1'),),
            ListTile( title: Text('Profesion 2'),),
          ],
        ),
    );
  }
}