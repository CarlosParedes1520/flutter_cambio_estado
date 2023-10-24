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
              // En este caso, se utiliza context.read<UsuarioCubit>().borrarUsuario()
              //para llamar al método borrarUsuario del cubit UsuarioCubit
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
    //UsuarioCubit es el cubit , UsuarioState es el estado

    //Crea un BlocBuilder que escucha el estado del cubit UsuarioCubit y se actualiza
    //cada vez que el estado cambia. El primer argumento de BlocBuilder es el tipo de
    //cubit que se está escuchando (UsuarioCubit) y el segundo argumento es una función
    //builder que se ejecuta cada vez que el estado cambia.
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      //Define una función anónima que toma dos argumentos, pero solo usa el segundo
      //argumento, state, que representa el estado actual del cubit.
      builder: (_, state) {
        print(state);
//El tipo de tiempo de ejecución es una forma de determinar la clase o tipo de un objeto en tiempo de ejecución.
        switch (state.runtimeType) {
          case UsuarioInicial: // class UsuarioInicial extends UsuarioState { final existeUsuario = false; }
            return Center(child: Text('No hay info del usussario'));
          case (UsuarioActivo): //class UsuarioActivo extends UsuarioState { final existeUsuario = true;}
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
