import 'package:estados/bloc/usuario/usuario_cubit.dart';
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
            onPressed: () {
              //una actualizacion ya no se coloca context.bloc, se pone es context.read
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: Icon(Icons.exit_to_app)
            )
        ]
      ),
      //envolvemos cuando mostrar la infromacion InformacionUsuario()
      //y se hace con BlocBuilder donde envolvemos su cubit con el estado <UsuarioCubit, UsuarioState>
      //BlocBuilder escucha los ambios en el estado
      body: BodyBloc(),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.arrow_right),
       onPressed: () {
         Navigator.pushNamed(context,  'pagina2');
       },
     ),
   );
  }
}

class BodyBloc extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) { 

           //aqui imprime el estado incial de nuestro estado que es false
           //print(state);

           //se hace validacion
           if( state is UsuarioInitial) {
             return Center(child: Text('No hay informacion del usuario'),);

             //en esta condicion se agrega el UsuarioActivo
             //para poder recir el usuario
           } else if ( state is UsuarioActivo ) {

           //los builder siempre regresan un widget
           return InformacionUsuario( state.usuario );    
           } else {
             return Center( child: Text('Estado no reconocido'));
           }


          /*ESTA ES UNA MANERA DE HACERLO, para no usar if else
          switch (state.runtimeType) {

          case UsuarioInitial:
            return Center(child: Text('No hay informacion del usuario'));
          break;

          case UsuarioActivo:
            return InformacionUsuario( (state as UsuarioActivo).usuario ); 
          break;

          default:
            return Center( child: Text('Estado no reconocido'));
        }
        */

           

           

      }
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  
  final Usuario usuario;

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

            ListTile( title: Text('Nombre: ${ usuario.nombre } '),),
            ListTile( title: Text('Edad: ${ usuario.edad }'),),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),

            //ListTile( title: Text('Profesion 1'),),

            ...usuario.profesiones!.map((profesion) => ListTile( title: Text( profesion ),)).toList()
            
          ],
        ),
    );
  }
}