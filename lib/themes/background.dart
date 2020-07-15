import 'package:flutter/material.dart';

//Fondo de contenedor
DecorationImage backgroundLogin = new DecorationImage(
  image: new ExactAssetImage('assets/img/fondo.jpg'),
  fit: BoxFit.cover,
);

DecorationImage backgroundVenta = new DecorationImage(
  image: new ExactAssetImage('assets/img/login2.jpg'),
  fit: BoxFit.fill,
);

DecorationImage tick = new DecorationImage(
  image: new ExactAssetImage('assets/img/icon-name.png'),
  fit: BoxFit.fill,
);

//Colores
Color colorPrimario = Color(0xFF0D47A1);

Color blanco = Color(0xFFCFD8DC);

Color selectedColor = Colors.white;

//Estilos de texto
TextStyle menuListTileDefaultText =
    TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);

TextStyle menuListTileSelectedText =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

//BoxDecoration
BoxDecoration showdowContainer = BoxDecoration(
                                      color: Colors.white,
                                      );

BoxDecoration borderLogin  = new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, .50),
                              blurRadius: 2, 
                            ),
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.5, 4.0),
                              blurRadius: 9.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5))
                          );

BoxDecoration decorationLogin = new BoxDecoration(
                  gradient: new LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(0, 0, 0, 0.8),
                  const Color.fromRGBO(0, 0, 0, 0.6),
                ],
                stops: [0.2, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ));

BoxDecoration decorationContainer = new BoxDecoration(
                        gradient: new LinearGradient(
                      colors: <Color>[
                        const Color.fromRGBO(255, 255, 255, 0.7),
                        const Color.fromRGBO(255, 255, 255, 0.7),
                      ],
                      stops: [0.2, 1.0],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    ));