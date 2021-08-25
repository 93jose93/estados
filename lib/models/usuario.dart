
class Usuario{
  //final dice que el valor no cambia
  final String? nombre;
  final int? edad;
  final List<String>? profesiones;

  Usuario({
      this.nombre,
      this.edad,
      this.profesiones 
  });

  //un nuevo metodo
  //una nueva instancia de el usuario
  //esta nueva copia se hace por que estos valores estan como final y 
  //al hacer copia le podemos cambiar los valores
  Usuario copiarUsuario({
    //los recibimos como argumentos
       String? nombre,
       int? edad,
       List<String>? profesiones
  }) {
      return Usuario(
          nombre:  nombre ??  this.nombre,
          edad:  edad ??  this.edad,
          profesiones:  profesiones ??  this.profesiones,
      );
  }
}