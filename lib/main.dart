import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //se importa la libreria de Getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      /*
      routes: {
        'pagina1': ( _ ) => Pagina1Screen(),
        'pagina2': ( _ ) => Pagina2Screen(),
      },
      */
      //esto es lo que agrega nuevo en getx, por que permite agregar mas cosas
      getPages: [
          GetPage(name: '/pagina1', page: () => Pagina1Screen()),
          GetPage(name: '/pagina2', page: () => Pagina2Screen())
      ],
      //con getx ya es diferente aplicarlo el tema
      //theme: ThemeData.dark(),
    );
  }
}