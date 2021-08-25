import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //aqui inicalizamos varios cubitprovider en la raiz de la app
    //para que se pueda usar en cualquier pagina Widget
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => new UsuarioCubit())
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