import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {}),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}),
          MaterialButton(
              child: Text('AÑADIR PROFECION ',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}),
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
