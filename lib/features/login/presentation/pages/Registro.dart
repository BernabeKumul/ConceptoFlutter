import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/presentation/pages/home_tablet.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/presentation/widgets/InputFieldArea.dart';
import 'package:servicio/themes/background.dart';

import 'login_props.dart';

class Registro extends StatefulWidget {
  Registro({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String usuario = "";
  String contrasenia = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginProps>(
        converter: (store) => mapToProps(store),
        builder: (context, props) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: 120, left: 100, right: 100, bottom: 100),
              child: Center(
                child: Stack(
                children: <Widget>[
                  Container(
                    decoration: borderLogin,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          width: 500,
                          height: MediaQuery.of(context).size.height * .90,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_back)),
                                  Text("")
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 30),
                                width: 400,
                                height: (MediaQuery.of(context).size.height * .90) * .60,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Crear Cuenta',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'Bienvenido!, ingrese su nombre de usuario y contraseña para crear una cuenta de usuario'),
                                    _controls(),
                                    _submitButton(null),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                                decoration: new BoxDecoration(
                          image: backgroundVenta,
                        )))
                      ],
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }

  Widget _submitButton(LoginProps props) =>  InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width * 0.29,
                padding: EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                color: Color(0xFF00695C),
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
          onTap: () {
            // props.login(
            //     Usuario(email: usuario, password: contrasenia), success, error);
            // print('usuario: ${usuario} contrasenia:${contrasenia}');
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomeTabletPage()));
          });

  Widget _controls() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(
              child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               InputFieldArea(
                hint: "Usuario",
                obscure: false,
                icon: Icons.person_outline,
                change: (String value) {
                },
              ),
               InputFieldArea(
                  hint: "Contraseña",
                  obscure: true,
                  icon: Icons.lock_outline,
                  change: (String value) {
                }),
               InputFieldArea(
                  hint: "Repetir contraseña",
                  obscure: true,
                  icon: Icons.lock_outline,
                  change: (String value) {
                }),
            ],
          )),
        ],
      ),
    );
  }

  Function success() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeTabletPage()));
  }

  Function error(String mensaje) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Validación",
      desc: mensaje,
      buttons: [
        DialogButton(
          child: Text(
            "Acceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}
