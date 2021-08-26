import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
     //este es el controlador creado
     //esta es la instancia
     final usaurioControler = Get.put(UsuarioController());



    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 1'),
        centerTitle: true,
      ),
      body: 
      //para mostrar la infromacion 
      //existeUsario esta en true asi se coloco
      //usaurioControler trae la infromacion del usuario
       Obx( ( ) => usaurioControler.existeUsario.value  
                   //como estara en true mostrara  informacion
                   ? InformacionUsuario( usuario: usaurioControler.usuario.value)
                   //cuando esta false 
                   : NoInfo()
       ),


      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_right),
       //onPressed: () => Navigator.pushNamed(context,  'pagina2')
       
       //esta es una forma de hacer la navegacion con getx
       //onPressed: () => Get.to(Pagina2Screen())
       //y esta otra forma
       //onPressed: () => Get.toNamed('pagina2'),

       //aqui enviaremos argumentos
       onPressed: () => Get.toNamed('pagina2', arguments: {
           'nombre' : 'Alejandro',
           'edad' : 27
       }),


     ),
   );
  }
}

class NoInfo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No hay usuario seleccionado'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  
  final Usuario usuario;

  const InformacionUsuario({ required this.usuario });

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

            ListTile( title: Text('Nombre: ${ this.usuario.nombre}'),),
            ListTile( title: Text('Edad: ${ this.usuario.edad}'),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            //ListTile( title: Text('Profesion 1'),),
            //como estamos dentro del un arreglo por eso lo espárce con ...
            ...usuario.profesiones.map((profesion) => ListTile(
              title: Text(profesion),
            ))

          ],
        ),
    );
  }
}