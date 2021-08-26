import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              BlocProvider.of<UsuarioBloc>(context).add( BorrarUsuario() )
            },
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: ( _ , state) {
           if(state.existeUsuario) {
             return InformacionUsuario( state.usuario );
           } else {
             return Center(
               child: Text('No hay un usuario seleccionado'),
             );
           }
        },
      ),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_right),
       onPressed: () {
         Navigator.pushNamed(context,  'pagina2');
       },
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {
  
  final Usuario? usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
        //tome todo el ancho que pueda
        width: double.infinity,     
        //tome todo el alto posible
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            ListTile( title: Text('Nombre: ${ usuario!.nombre } '),),
            ListTile( title: Text('Edad:  ${ usuario!.edad }'),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            //ListTile( title: Text('Profesion 1'),),
            ...usuario!.profesiones!.map(
              (profesion) => ListTile( title: Text( profesion ),)
            ).toList()
          ],
        ),
    );
  }
}