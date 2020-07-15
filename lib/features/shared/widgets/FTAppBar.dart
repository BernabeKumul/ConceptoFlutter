import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicio/features/home/presentation/pages/perfil_usuario.dart';
import 'package:servicio/features/shared/widgets/FTDropDown.dart';
import 'package:servicio/themes/background.dart';

class FTAppBar extends StatelessWidget {
  String nombre_usuario;
  final media;

  FTAppBar({
    @required this.media,
    @required this.nombre_usuario
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        width: media.width,
        child: Container(
          decoration: showdowContainer,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.important_devices, size: 35, color: colorPrimario),
                      SizedBox(width: 10),
                      Text("JJ Software", style: GoogleFonts.oswald(fontSize: 24, color: colorPrimario)),
                      // InkWell(
                      //   onTap: () {
                      //     // setState(() {
                      //     // });
                      //   },
                      //   child: Icon(
                      //     Icons.menu,
                      //     size: 30,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, right: 15),
                  child: Row(children: <Widget>[
                    Text(
                      nombre_usuario,
                      style: GoogleFonts.arapey(fontSize: 19),
                    ),
                    SimpleAccountMenu(
                      icons: [
                        Icon(Icons.person),
                      ],
                      iconColor: Colors.white,
                      onChange: (index) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PerfilUsuarioPage()));
                      },
                    )
                  ]),
                )
              ]),
        ));
  }
}
