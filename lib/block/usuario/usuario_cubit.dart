import 'package:estados_cambios/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void edadUsuario(int edad) {
    final currentState = state;
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
    emit(UsuarioInitial());
  }
}
