part of 'usuario_bloc.dart';

//modifica todos los estados
class UsuarioState {

//estado inmutable ya que no se pueden cambiar 
  final bool existeUsuario;
  final Usuario? usuario;

  UsuarioState({ Usuario? user })
   : usuario = user ?? null,
     existeUsuario = (user != null ) ? true : false;
   
  //aqui regresa una nueva instancia 
  //es un metodo que regresa UsuarioState
  //esto se a echo para mantener el estado actual del estado
  //si yo no uso copyWith
  UsuarioState copyWith({ 
    Usuario? usuario 
  }) => UsuarioState(
     //si yo no uso copyWith la idea es que mantenga el estado actualmente
    user: usuario ?? this.usuario
  );

  UsuarioState estadoInicial() => new UsuarioState();

}