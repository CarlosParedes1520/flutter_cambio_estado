 //Esta línea indica que este archivo forma parte de otro archivo llamado 'usuario_cubit.dart'. 
 //La palabra clave part se utiliza en Dart para dividir una clase en múltiples archivos.
part of 'usuario_cubit.dart';
//@immutable: Esta anotación se utiliza para indicar que todas las clases que implementan UsuarioState 
//deben ser inmutables, es decir, no se pueden modificar una vez que se crean. Esto es una buena práctica 
//en el manejo de estados, ya que ayuda a prevenir errores y facilita el rastreo de cambios en el estado.
@immutable
// Aquí se define una clase abstracta llamada UsuarioState. Una clase abstracta no puede ser instanciada 
//directamente, pero puede ser utilizada como base para otras clases. En este caso, UsuarioState servirá 
//como una base para las distintas representaciones del estado del usuario en tu aplicación.
abstract class UsuarioState {}

class UsuarioInicial extends UsuarioState {
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
