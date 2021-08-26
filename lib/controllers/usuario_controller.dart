import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  
  //esto es un bool, pero es una porgramacion reactiva de GetX
  var existeUsario = false.obs;
  //este es pára redibujar el usaurio
  var usuario = new Usuario().obs;


//para refactorizar 
//un metodo
int get profesionesCount {
  return this.usuario.value.profesiones.length;
}

  //metodo de añadir usuario
  void cargarUsuario( Usuario pUsuario ) {
    
    //cambia el valor a true
    this.existeUsario.value = true;

     //instancia
     //agrega al usaurio
     this.usuario.value = pUsuario;
  }

  //nuevo metodo

  void cambiarEdad( int pEdad ) {
    this.usuario.update((val) {
      val!.edad = pEdad;
    });
  }

  void agregarProfesion( String pProfesion ) {
    this.usuario.update((val) {
      val!.profesiones = [ ...val.profesiones, pProfesion];
    });
  }
}