import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

//importacion especial que contra el otro archivo que esta en la misma carpeta
part 'usuario_state.dart';

//aqui le asignamos el tipo de valor que manejara el Cubit <int>,
// ejemplo aqui se usan de tipo UsuarioState que es en otro archivo que maneja los estados
class UsuarioCubit extends Cubit<UsuarioState>{
 
  //aqui llamo el estado donde se incia el estado
  UsuarioCubit() : super(UsuarioInitial());
    
    //aqui se reciven los estados

  //se creara un metodo que no regrese nada
  void seleccionarUsuario( Usuario user ){
    //aqui recibimos el usuario activo
    //y emitira el nuevo estado
     emit( new UsuarioActivo(user));
  }

  //nuevo cubit para cambiar edad
  void cambiarEdad( int edad ){

    //esto es una referencia vacio
    final currentState = state;
    //validacion para que no de error 
    if( currentState is UsuarioActivo) {
 
        final newUser = currentState.usuario.copiarUsuario(edad: 28);


        //currentState.usuario.edad = 28;
        //hay que emitir los cambios
        emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion( ) {
         
          //esto es una referencia vacio
    final currentState = state;
    //validacion para que no de error 
    if( currentState is UsuarioActivo) {

      final newProfesiones = [
        //expres opereitor ...
          ...currentState.usuario.profesiones!,
          'Profesión ${ currentState.usuario.profesiones!.length +1 }'
      ];
      final newUser = currentState.usuario.copiarUsuario( profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  //borrar usaurio, o simulacion de logaut
  void borrarUsuario(){
    emit(UsuarioInitial());
  }

  

}