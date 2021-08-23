import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //usamos la instancia de usuario
    //como estamos dentro de un metodo no se puede redibujar (context, listen: false)
    final usuarioService = Provider.of<UsuarioService>(context);

  

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
           ? Text('Nombre: ${ usuarioService.usuario!.nombre } ')
           : Text('Pagina 2'),
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
                
                final newUser = new Usuario(
                  nombre: 'Jose Alejandro',
                  edad: 27,
                  profesiones: [ 'FullStack Developer', 'Video Jugador Experto']
                );

                usuarioService.usuario = newUser;

              } 
            ),
            MaterialButton(
              child:Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                  usuarioService.cambiarEdad(28);
              } 
            ),
            MaterialButton(
              child:Text('Añadir Profesion', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                  usuarioService.agregarProfesion();
              } 
            ),
          ],
        )
     ),
   );
  }
}