import 'package:estados_cambios/block/usuario/usuario_cubit.dart';
import 'package:estados_cambios/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('PAge 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: "Juan",
                  edad: 35,
                  profesiones: ['fulstack', 'desarrollador'],
                );
                usuarioCubit.seleccionarUsuario(newUser);
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.edadUsuario(25);
              }),
          MaterialButton(
              child: Text('AÑADIR PROFECION ',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion('profession ');
              }),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        }, //TODO: Implementar o botão de voltar para a página anterior
      ),
    );
  }
}
