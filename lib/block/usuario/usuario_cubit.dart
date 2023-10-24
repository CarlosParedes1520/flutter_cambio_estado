import 'package:estados_cambios/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// indica que este archivo forma parte de otro archivo llamado 'usuarios_state.dart'.
//La palabra clave part se utiliza en Dart para dividir una clase en múltiples archivos.
part 'usuarios_state.dart';

// extiende la clase abstract class UsuarioState {}
class UsuarioCubit extends Cubit<UsuarioState> {
  //el constructor inicializa la clase UsuarioInicial
  UsuarioCubit() : super(UsuarioInicial());
//emit metodo heredado del cubit
  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

/*
Nota: Cuando se crea una instancia de Cubit ejemplo Cubit<UsuarioState>, se inicializa 
con un estado inicial. Luego, a lo largo de la ejecución de la aplicación, puedes 
acceder y modificar el estado a través de la propiedad state y el método emit.
 emit(UsuarioState state) viene de extends Cubit<UsuarioState>
*/
  void edadUsuario(int edad) {
    //UsuarioState get state
    final currentState = state;
    //Comprueba si el objeto almacenado en currentState es una instancia de la clase
    //UsuarioActivo. Esta verificación se hace para asegurarse de que el estado
    //actual sea realmente un UsuarioActivo
    if (currentState is UsuarioActivo) {
      // currentState.usuario.edad = 20;
      final newUser = currentState.usuario.copyWith(edad: 18);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // currentState.usuario.edad = 20;
      final newProfession = [
        ...currentState.usuario.profesiones!,
        '$profesion ${currentState.usuario.profesiones!.length}'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: newProfession);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInicial());
  }
}
