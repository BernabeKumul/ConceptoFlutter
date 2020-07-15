import 'package:flutter/material.dart';

class FtTable extends StatelessWidget {
  final List<String> headers;

  FtTable({@required this.headers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // Container(
            //   child:  ListView.builder(
            //         itemCount: headers.length,
            //         itemBuilder: ( context, i ) => _columTitle(headers[i]),
            // ))
            // Text(
            //   'Correo',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // ),
            // Text(
            //   'Nombre',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // ),
            // Text(
            //   'Puesto',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // ),
            // Text(
            //   'Sueldo',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // ),
            // Text(
            //   'Estatus',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // ),
            // Text(
            //   'Acciones',
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.black, fontSize: 15),
            // )
          ],
        ),
      ],
    );
  }

  Widget _columTitle(String title) => Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.black, fontSize: 15),
      );
}
