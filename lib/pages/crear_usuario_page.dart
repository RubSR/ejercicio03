import 'package:ejercicio03/models/usuario.dart';
import 'package:ejercicio03/pages/crear_trabajo_page.dart';
import 'package:ejercicio03/pages/lista_usuarios_page.dart';
import 'package:flutter/material.dart';

import '../models/trabajo.dart';


class CrearUsuarioPage extends StatefulWidget {
  const CrearUsuarioPage({Key? key}) : super(key: key);

  @override
  State<CrearUsuarioPage> createState() => _CrearUsuarioPageState();
}

class _CrearUsuarioPageState extends State<CrearUsuarioPage> {

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidosCtrl = TextEditingController();
  Trabajo? trabajoSeleccionado ;
  List<Trabajo> trabajos = [];
  List<Usuario> usuarios = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear usuario'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Nombre'),
                hintText: 'Nombre del usuario',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
              ),
              controller: nombreCtrl,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                  label: Text('Apellidos'),
                  hintText: 'Apellidos del usuario',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
              controller: apellidosCtrl,
            ),
            SizedBox(height: 30),
            _trabajosSelect(),
            TextButton(
                onPressed: () async {
                  //Haremos la logica para ir a la página de añadir trabajo
                  Trabajo? trabajo = await
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CrearTrabajo())
                      );
                  if(trabajo != null){
                    //lo añadimos a la lista
                    setState(() {
                      trabajos.add(trabajo);
                    });
                  }
                },
                child: Text('Añadir trabajo')
            ),
            SizedBox(height: 100),
            TextButton(
                onPressed: () async{
                  //Logica para navegar a la pantalla de ver usuarios
                  //List<Usuario>
                  if(nombreCtrl.text.isNotEmpty && apellidosCtrl.text.isNotEmpty &&
                  trabajoSeleccionado != null){
                    Usuario usuario = Usuario(nombreCtrl.text, apellidosCtrl.text, trabajoSeleccionado!);
                    
                    usuarios.add(usuario);
                    //Navegar a la pantalla de lista de usuarios pasandole la lista a pintar
                    await Navigator.push(context, MaterialPageRoute(builder: (context)=> Usuarios(usuarios: usuarios)
                    ));
                    setState(() {
                      trabajoSeleccionado = null;
                      nombreCtrl.text = '';
                      apellidosCtrl.text = '';
                    });
                  }
                },
                child: Text('Guardar y ver usuarios')
            )
          ],
        ),
      ),
    );
  }


 Widget _trabajosSelect() {
    return DropdownButton(
      //Variable del tipo de la lista inicial
      // que luego nos sirve para cambiar el estado
      // de la seleccion
      isExpanded: true,
      hint: Text('Seleccione trabajo') ,
      value: trabajoSeleccionado,
      //Item son las opciones que va a tener dentro
      // List<Trabajo> -> dropDownMenuItems
        items: _getOpciones(),
        onChanged: (Trabajo? trabajo){
          setState(() {
            trabajoSeleccionado = trabajo!;
          });
        }
    );
  }


  List<DropdownMenuItem<Trabajo>> _getOpciones() {
    List<DropdownMenuItem<Trabajo>> lista = [];

    trabajos.forEach((trabajo) {
      lista.add(
        DropdownMenuItem(
          //La parte visual del dropDown
            child: Text(trabajo.puesto),
            value: trabajo,
        )
      );
    });
    return lista;

  }
}
