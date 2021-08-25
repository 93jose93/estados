
//esto quiere decir que es parte del otro archivo
part of 'usuario_cubit.dart';

//esto es para que no sea usado en otro archivo en el
// exterior algun estado de la app y solo se pueda agregar aqui
@immutable
abstract class UsuarioState{}
//estato incial de mi funcion
class UsuarioInitial extends UsuarioState{

    //como no le e dado al boton le doy una propiedad por defecto
    final existeUsuario = false;


    //para saber en consola que esto esta funcionando se imprime un mensaje 
    @override
    String toString() {   
      return 'UsuarioInicial: existeUsuario: $existeUsuario ';
    }
}

//nueva clase
//cuando el usuario existe o se agrego haga esto 
class UsuarioActivo extends UsuarioState {
    final existeUsuario = true;
    
    //aqui tenemos la informacion del usuario que se envio
    final Usuario usuario;

    UsuarioActivo(this.usuario);
}