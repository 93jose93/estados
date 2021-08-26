import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
                 final newUser = new Usuario(
                   nombre: 'Jose Sanchez',
                   edad: 27,
                   profesiones: ['FullStack Developer']
                 );


                //con block importamos la instancia
                BlocProvider.of<UsuarioBloc>(context).add(
                  ActivarUsuario(newUser)
                );

              } 
            ),
            MaterialButton(
              child:Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                    
                BlocProvider.of<UsuarioBloc>(context).add(
                  CambiarEdad(28)
                );
              } 
            ),
            MaterialButton(
              child:Text('Añadir Profesion', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                  BlocProvider.of<UsuarioBloc>(context).add(
                  CambiarProfesion('Nueva Profesion')
                ); 
              } 
            ),
          ],
        )
     ),
   );
  }
}