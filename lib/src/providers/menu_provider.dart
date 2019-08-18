import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

   // se crea un future para que retorne una tarea
   // que se va realizar
   Future<List<dynamic>> cargarData() async {
      // con este metodo leemos lo que tiene un json
      final resp = await rootBundle.loadString('data/menu_opts.json');
       Map dataMap = json.decode(resp);
        // guardamos las rutas en la lista opciones
        opciones = dataMap['rutas'];
       // print(dataMap);
        return opciones;
      }

    }
// expone la instancia creada de MenuProvider
final menuProvider = new _MenuProvider();
  