import 'package:component_flutter/src/providers/menu_provider.dart';
import 'package:component_flutter/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      // se enlaza a lo que se espera en este caso al future del menu_provider
      future: menuProvider.cargarData(),
      // es un elemnto inicial
      initialData: [],
      // recibe una funcion que tiene un context y un asyncSnapshot
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItem(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        // agregar icons desde strings desde una funcion en utils
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /* final route = MaterialPageRoute(
           builder: (context) => AlertPage()
           
         );
         //navegación
         Navigator.push(context, route); */
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
