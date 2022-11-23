import 'package:flutter/material.dart';

import '../models/usuario.dart';


class Usuarios extends StatelessWidget {
  final List<Usuario> usuarios;

  const Usuarios({Key? key, required this.usuarios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
          itemBuilder: (context, int i){ //Trabajo como un for
            return ListTile(
              title: Text('${usuarios[i].nombre}, ${usuarios[i].apellidos}'),
              subtitle: Text('${usuarios[i].trabajo.sector}, ${usuarios[i].trabajo.puesto}'),
            );
          }

      ),
    );
  }
}
