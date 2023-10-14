import 'package:estados_cambios/block/usuario/usuario_cubit.dart';
import 'package:estados_cambios/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAge 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),

        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        }, //TODO: Implementar o botão de voltar para a página anterior
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay info del usussario'));

          case (UsuarioActivo):
            return InformacionUsuario((state as UsuarioActivo).usuario);

          default:
            return Center(child: Text('No reconocido'));
        }
        // if (state is UsuarioInitial) {
        //   return Center(
        //     child: Text('No hay info del usuario'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return
        // }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('nombre: ${usuario.nombre}')),
          ListTile(title: Text('edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones!
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
