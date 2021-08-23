import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';


//hay que pasarlo por el mixin ChangeNotifier esto no probiene de provider, probiene de material
//ChangeNotifier notifica cuando cambia el estado de una de las clases
class UsuarioService with ChangeNotifier{
   Usuario? _usuario;
   
   //por get controlamos como lo retorna 
   //esto es una instancia
   Usuario? get usuario => this._usuario;
   //aqui retornamo un bool si exite o si no existe
   bool get existeUsuario => (this._usuario != null) ? true : false;


   //para cargar el usuario a trabes de set
   //cuando se quiera establecer un balor 

   set usuario (Usuario? user) {
      this._usuario = user;
      notifyListeners();
   }


   void cambiarEdad( int edad ) {
      this._usuario!.edad = edad;
      notifyListeners();
   }

   void removerUsuario(){
      this._usuario = null;
      notifyListeners();
   }

   void agregarProfesion() {
       this._usuario!.profesiones.add('Profesion ${ this._usuario!.profesiones.length +1 }');
       notifyListeners();
   }
}