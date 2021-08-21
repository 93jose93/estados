import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';


class Pagina1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 1'),
        centerTitle: true,
      ),
      //Stream Bulder es algo nativo de flutter, este hace que se redibujen los singlenton
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              
               //para usar el singleton
                //existeUsuario retorna un bool
                //se hace un operador ternario donde pregunta 
                //si existe , muestre InformacionUsuario()
                //de lo contrario :

                //snapshot.hasData esto es si tiene data
               return snapshot.hasData
                //antes enviabamos esto usuarioService.usuario, pero ahora 
                //como usamos Stream podemos traer la infromacion de otra forma
                ? InformacionUsuario( snapshot.data )
                : Center(child: Text('No hay infromación del usuario'),); 

        },
      ),
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
  
  final Usuario? usuario;

  const InformacionUsuario( this.usuario );

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

            ListTile( title: Text('Nombre: ${ usuario!.nombre}'),),
            ListTile( title: Text('Edad: ${ usuario!.edad}'),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            ListTile( title: Text('Profesion 1'),),
            ListTile( title: Text('Profesion 2'),),
          ],
        ),
    );
  }
}