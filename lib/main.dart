import 'package:estados_cambios/block/usuario/usuario_cubit.dart';
import 'package:estados_cambios/pages/pagina1_page.dart';
import 'package:estados_cambios/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsuarioCubit>(create: (_) => UsuarioCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
