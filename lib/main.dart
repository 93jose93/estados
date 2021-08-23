import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:estados/services/usuario_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //para usar provider, se coloca en la raiz para que sea usado en todo las paginas que se creen
    //se envolvio MaterialApp con MultiProvider y este puede agregar varios providers que se creen
    return MultiProvider(
      providers: [
        //aqui hacemos que traiga una nueva instancia de UsuarioService
        ChangeNotifierProvider(create: ( _ ) => new UsuarioService(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': ( _ ) => Pagina1Screen(),
          'pagina2': ( _ ) => Pagina2Screen(),
        },
      ),
    );
  }
}