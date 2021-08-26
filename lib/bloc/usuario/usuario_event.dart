part of 'usuario_bloc.dart';
//accines que modificaran los estados
//para poder controlar que evento va apoder manejar 
@immutable
abstract class UsuarioEvent {}

//los eventos son disparados desde cualquier otro lugar

class ActivarUsuario extends UsuarioEvent {

  final Usuario usuario;
  ActivarUsuario(this.usuario);

//esto es para ver un ejemplo de la instancia del usuario en consola
 @override
  String toString() {
       return 'Instancia del Usuario: ${ this.usuario.nombre }';
  }

}

//evento donde reciba el valor de edad
class CambiarEdad extends UsuarioEvent {

  final int edad;
  CambiarEdad(this.edad);

}

class CambiarProfesion extends UsuarioEvent {
  final String profesion;

  CambiarProfesion(this.profesion);



}

class BorrarUsuario extends UsuarioEvent {}