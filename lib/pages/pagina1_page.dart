import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  //aqui ya podemos hacer la instancia del provider ya que esta en la raiz
  //como esta en build por defecto el llega en true (context, listen: true) para redibujar,
  // osea esta escuchando que haya cambios 
    final usuarioService = Provider.of<UsuarioService>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => usuarioService.removerUsuario()
            ,
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: usuarioService.existeUsuario
      ? InformacionUsuario( usuarioService.usuario )
      : Center( child: Text('No hay usuario seleccionado'),),
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
  
  //aqui establecemos el valor que llega desde pagina 2
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
            
            //ya aqui podemos mostrar la infromacion
            ListTile( title: Text('Nombre: ${ usuario!.nombre }'),),
            ListTile( title: Text('Edad: ${ usuario!.edad }'),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),
            
            //aqui traemos una lista 
            //con esto .map lo hacemos iterable
            //hacemos una instancia de cada profesion
            //pero tenemos que devolver una lista
            //... esto significa destructuracion
            ...usuario!.profesiones.map(
              (profesion) => ListTile(title: Text(profesion))
            ).toList()

            //ListTile( title: Text('Profesion 1'),),
           
          ],
        ),
    );
  }
}