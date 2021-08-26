
class Usuario{
  //se colocal final es para que el mismo desarrollador
  // no cometa el error de modificar las propiedades original

  final String? nombre;
  final int? edad;
  final List<String>? profesiones;

  Usuario({
      this.nombre,
      this.edad,
      this.profesiones
  });

  //hacemos una copia de las propiedades originales para no modificar las originales de Usuario
 //se crea una nueva instancia de usuario
 Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
 }) => Usuario(
   //aqui pregunnta so es nombre usa nombre, pero de contrario ?? usa la instancia de la clase nueva 
   //esto lo hacemos por que modificaremos solo la nueva edad para agregar el evento de nueva edad
   nombre: nombre ?? this.nombre,
   edad: edad ?? this.edad,
   profesiones: profesiones ?? this.profesiones,

 );

}