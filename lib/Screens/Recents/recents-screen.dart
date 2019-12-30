import 'package:flutter/material.dart';

class RecentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: recentsList(),
    );
  }

  recentsList() {
    return new Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(null, false),
              ),
              SizedBox(
                width: 85,
              ),
              Align(
                  child: Text(
                "Recentes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.motorcycle,
              color: Colors.red,
            ),
            title: Text(
              'Envio de documentos',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent[700]),
              textAlign: TextAlign.justify,
            ),
            subtitle: Column(
              children: <Widget>[
                Text('Origem: Rua José Lungwitz, 26 - Jardim Ipanema'),
                Text(
                    'Destino: Rua Francisco Henrique da Rosa, 82 - Parque das Paineiras'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Motorista: Tais Rocha',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text('Valor: 10.25'),
                  ),
                ),
              ],
            ),
            //

            trailing: Icon(Icons.more_vert),
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.motorcycle,
              color: Colors.red,
            ),
            title: Text(
              'Envio de documentos',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent[700]),
              textAlign: TextAlign.justify,
            ),
            subtitle: Column(
              children: <Widget>[
                Text('Origem: Rua José Lungwitz, 26 - Jardim Ipanema'),
                Text(
                    'Destino: Rua Pedro Antonio Fernandes, 236 - Jardim Santa Esmeralda'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Motorista: Carlos Gomes',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text('Valor: 17.89'),
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert),
          )),
          Card(
              child: ListTile(
            leading: Icon(
              Icons.motorcycle,
              color: Colors.red,
            ),
            title: Text(
              'Entrega pedal de distorção',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent[700]),
              textAlign: TextAlign.justify,
            ),
            subtitle: Column(
              children: <Widget>[
                Text('Origem: Rua José Lungwitz, 26 - Jardim Ipanema'),
                Text('Destino: Av. Angélica, 82 - Centro'),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Motorista: João Donato Santos',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text('Valor: 7.89'),
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert),
          )),
        ],
      ),
    );
  }
}
