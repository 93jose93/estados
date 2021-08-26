import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //aqui obtenemos los argumentos
    // print( Get.arguments );
    // print( Get.arguments['nombre'] );

    //intancia
    final usaurioControler = Get.find<UsuarioController>();

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
                 usaurioControler.cargarUsuario(Usuario(nombre: 'Alejandro', edad: 27));
                 Get.snackbar(
                   'Usuario establecido',
                   'Exito con el cambio del Usuario Alejandro',
                   backgroundColor: Colors.white,
                   boxShadows: [
                     BoxShadow(
                       color: Colors.black38,
                       blurRadius: 10
                     )
                   ]
                 );
              } 
            ),
            MaterialButton(
              child:Text('Cambiar Edad', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                 usaurioControler.cambiarEdad(28);
              } 
            ),
            MaterialButton(
              child:Text('Añadir Profesion', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                //usaurioControler.agregarProfesion('Profesion #${ usaurioControler.usuario.value.profesiones.length + 1 }');
                //refactorizo la linea de arriba en controlador ya que es muy grande y suele confundir 
                usaurioControler.agregarProfesion('Profesion #${ usaurioControler.profesionesCount + 1}');
              } 
            ),
            MaterialButton(
              child:Text('Cambiar tema', style: TextStyle(color: Colors.white,)),
              color:Colors.blue,
              onPressed: (){
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() :  ThemeData.dark());             
              } 
            ),
          ],
        )
     ),
   );
  }
}