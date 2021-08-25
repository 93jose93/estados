import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Screen extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();


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
               //aqui agregamos un nuevo usuario al precionar el boton
                final newUser = new Usuario(
                  nombre: 'Jose sanchez',
                  edad: 27,
                  profesiones: [
                      'FullStack Developer',
                      'Video jugador Tester'
                  ]);

                  //busca dentro el contex un bloc
                  //aqui pide un nuevo usuario
                  usuarioCubit.seleccionarUsuario(newUser);
              } 
            ),
            MaterialButton(
              child:Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                  usuarioCubit.cambiarEdad(28);
              } 
            ),
            MaterialButton(
              child:Text('Añadir Profesion', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                 usuarioCubit.agregarProfesion();
              } 
            ),
          ],
        )
     ),
   );
  }
}