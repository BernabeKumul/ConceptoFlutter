import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/presentation/pages/home_tablet.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/presentation/pages/signup_tablet.dart';
import 'package:servicio/features/login/presentation/widgets/InputFieldArea.dart';
import 'package:servicio/features/login/presentation/widgets/login_imple.dart';
import 'package:servicio/themes/background.dart';

import 'login_props.dart';

class LoginPageTablet extends StatefulWidget {
  LoginPageTablet({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageTabletState createState() => _LoginPageTabletState();
}

class _LoginPageTabletState extends State<LoginPageTablet> {
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
          bool loading = props.isLoading;
          return Scaffold(
              body: SingleChildScrollView(
                  child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: backgroundLogin,
            ),
            child: Container(
              decoration: decorationLogin,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .60,
                    height: MediaQuery.of(context).size.height * .78,
                    decoration: decorationContainer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 30),
                        _title(),
                        SizedBox(height: 30),
                        _labelTitulo(),
                        _controls(),
                        SizedBox(height: 40),
                        _submitButton(props),
                        _labelPassword(),
                        _divider(),
                        SizedBox(height: 30),
                        _buildIcon()
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _loginAccountLabel(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: LoginImple(isLoading: loading),
                  ),
                ],
              ),
            ),
          )));
        });
  }

  Widget _labelTitulo(){
    return Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Bienvenido a flutter',
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ));
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Aun no tiene cuenta?',
            style: TextStyle(fontSize: 13, color: Colors.white54),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPageTablet()));
            },
            child: Text(
              'Registrar',
              style: TextStyle(
                  color: Color(0xfff57C00), //0xff4db6ac
                  fontSize: 13),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIcon() {
    List<Widget> login = [];

    login.add(GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(Icons.face, size: 25.0, color: Colors.black),
      ),
    ));
    login.add(GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(Icons.favorite_border, size: 25.0, color: Colors.black),
      ),
    ));
    login.add(GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.0,
        width: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(Icons.face, size: 25.0, color: Colors.black),
      ),
    ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: login,
    );
  }

  Widget _labelPassword() {
    return Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'Olvidaste tu contraseña?',
          style: TextStyle(color: Colors.white54),
        ));
  }

  Widget _submitButton(LoginProps props) {
    return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF42AA5F5), Color(0xFF3949AB)])),
              child: Text(
                'Iniciar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
        onTap: () {
          props.login(
              Usuario(email: usuario, password: contrasenia), success, error);
          print('usuario: ${usuario} contrasenia:${contrasenia}');
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomeTabletPage()));
        });
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white54,
              ),
            ),
          ),
          Text('o', style: TextStyle(color: Colors.white54)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.white54,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: 'Flutter',
          style: GoogleFonts.lobster(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 50,
              color: Colors.black),
        ),
      ]),
    );
  }

  Widget _controls() {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                hint: "Usuario",
                obscure: false,
                icon: Icons.person_outline,
                change: _changeUsuario,
              ),
              new InputFieldArea(
                  hint: "Contraseña",
                  obscure: true,
                  icon: Icons.lock_outline,
                  change: _changeContrasenia),
            ],
          )),
        ],
      ),
    ));
  }

  Function _changeUsuario(String texto) {
    usuario = texto;
  }

  Function _changeContrasenia(String texto) {
    contrasenia = texto;
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
