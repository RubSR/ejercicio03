import 'package:flutter/material.dart';

import '../models/trabajo.dart';

class CrearTrabajo extends StatelessWidget {
   CrearTrabajo({Key? key}) : super(key: key);

  TextEditingController sectorCtrl = TextEditingController();
  TextEditingController puestoCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear trabajo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text('Sector'),
                hintText: 'Sector laboral',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            controller: sectorCtrl,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
                label: Text('Puesto'),
                hintText: 'Puesto laboral',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            controller: puestoCtrl,
          ),
          SizedBox(height: 50),
          TextButton(
              onPressed: (){
                //Devolveremos el trabajo creado
                if(sectorCtrl.text.isNotEmpty && puestoCtrl.text.isNotEmpty){
                  Trabajo trabajo = Trabajo(sectorCtrl.text, puestoCtrl.text);
                  Navigator.pop(context, trabajo);
                }
              },
              child: Text('Guardar')
          )
        ],
      ),
    );
  }
}
