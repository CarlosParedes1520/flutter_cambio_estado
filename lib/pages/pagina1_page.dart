import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAge 1'),
      ),
      body: InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),

        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        }, //TODO: Implementar o botão de voltar para a página anterior
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    super.key,
  });

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
          ListTile(title: Text('Nombre')),
          ListTile(title: Text('Edad')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Profesion 1')),
          ListTile(title: Text('Profesion 2')),
          ListTile(title: Text('Profesion 3')),
        ],
      ),
    );
  }
}
