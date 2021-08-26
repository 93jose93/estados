//segun el desarrollador meta es mas liviano
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';


part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {

  //esto es para incializar 
  UsuarioBloc() : super(UsuarioState());

 
  //recibe un evento y cambia de estado
  //hay que emtir un valor mapEventToState
  //async* significa que va a emitir un Stream
  //async si estubiera solo emite es un Future, pero este no es el caso lo que necesitamos
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    //aqui se ve la instancia del usuario
    //la instancia llega desde el usuario_event.dart y se imprime
    print(event);
 
    //validacion de cada evento 
    //se hace doble verificacion de copyWith, cuando el estado cambia cuando se agrega un nuevo estado
    //o cuando se borra el estado colocando el original copyWith, y no modificando los que biene de final
    if(event is ActivarUsuario){
        //aqui emite 
        yield state.copyWith(
           usuario: event.usuario
        ); 
    } else if ( event is CambiarEdad) {
         //aqui trae el evento actual que posee
         yield state.copyWith(
           //y aqui trae el evento nuevo que trae, 
           usuario: state.usuario!.copyWith(edad: event.edad)
        );   
    } else if ( event is CambiarProfesion) {
      //este es copyWith del estado
        yield state.copyWith(
          //este es copyWith del usuario
          usuario: state.usuario!.copyWith(
            profesiones: [
              //nuevo arreglo y se desostrutura, que estan en ...state.usuario!.profesiones! y añade la del evento
                ...state.usuario!.profesiones!,
                event.profesion
            ]
          )
        );
    } else if ( event is BorrarUsuario) {
      //aqui mandamos por que se a realizado una comprobacion en UsuarioState
      // de que si no hay nada que sea falso y salga el mensaje
      //aqui no uso esto //borra al usuario copiando el estado anterior
      //si no lo puso en estado incial
       yield state.estadoInicial();
      
    }

    
    

  }

}