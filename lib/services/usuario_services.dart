import 'dart:async';

import 'package:estados/models/usuario.dart';

//no se pueden crear instancia fuera de este archivo por eso se agrega en privado

//esta es una menra de crearce un Singleton
class _UsuarioService {

  //se hace privado para establecer valores
  Usuario? _usuario;

  //porpiedad para redibujar
  //le definimos que tipo

  //por defecto, lo crea que solo una persona lo este escuchando, que es pagina uno, y en pagina no funcionara
  //para que este escuchando varios usar .broadcast()
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  

  //esto se hace para mantener el control de como se lee y
  // como se establece la infromacion por eso el _usuario es privado
  Usuario? get usuario => this._usuario;

  //retornar un bool
  //se hace un operador ternario preguntando, si es diferente de null, es true,
  //de lo contrario es false si no tenemos nada
  bool get existeUsuario => ( this._usuario != null) ? true : false;


  //crear  un geter para exponer y hacer los cambios que emite _usuarioStreamController
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;


  //metodo para cargar la informacion

  //aqui instanciamos ( Usuario user)
  //y podremos ver que podemos usar metodos privados
  void cargarUsuario( Usuario user) {
    this._usuario =  user;

     //aqui cargarmos un nuevo elemento de Stream para que redibuje, enviando al streamBuilder
     
     this._usuarioStreamController.add(user);

  }

  //nuevo metodo
  void cambiarEdad( int edad ) {
     this._usuario!.edad = edad;

      //aqui cargarmos un nuevo elemento de Stream para que redibuje, enviando al streamBuilder
     this._usuarioStreamController.add(this._usuario!);
  }


  //hay que cerrar las intancias de Stream y con esto lo hacemos
  //y no tenemos fugas de memoria
  dispose() {
    //se puede agregar el signo de _usuarioStreamController? para
    // segurarnos de que si hay infromacion que lo cierre y si no que no haga nada
     this._usuarioStreamController.close();
  }
  
} 

//va usar esta instancia 
final usuarioService = new _UsuarioService();