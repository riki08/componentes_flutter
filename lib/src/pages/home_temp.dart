import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comnenentes Temp'),
      ),
      body: ListView(
        ///children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      // dart ofrece una forma mas limpia de codigo con el ..funcion
      lista..add(tempWidget)..add(Divider(color: Colors.amberAccent));
    }

    return lista;
  }
  // otra forma de realizar los Items
  List<Widget> _crearItemsCorto(){

    return opciones.map((item){

      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '¡'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
        ],
      );

    }).toList();
  }
}
