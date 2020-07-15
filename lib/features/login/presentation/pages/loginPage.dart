import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/presentation/pages/home.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/login/domain/entities/user.dart';
import 'package:servicio/features/login/presentation/pages/signup.dart';
import 'package:servicio/features/login/presentation/widgets/InputFieldArea.dart';
import 'package:servicio/features/shared/widgets/FTColorLoader3.dart';
import 'package:servicio/themes/background.dart';

import 'login_props.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(0, 0, 0, 0.8),
                  const Color.fromRGBO(0, 0, 0, 0.6),
                ],
                stops: [0.2, 1.0],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              )),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _title(),
                      SizedBox(height: 30),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Bienvenido a flutter',
                            style: TextStyle(color: Colors.white54),
                          )),
                      _controls(),
                      SizedBox(height: 40),
                      _submitButton(props),
                      _labelPassword(),
                      _divider(),
                      SizedBox(height: 30),
                      _buildIcon()
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _loginAccountLabel(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: _loading(loading),
                  ),
                ],
              ),
            ),
          )));
        });
  }

  Widget _loading(bool isLoading) {
    if (isLoading) {
      return Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            colors: <Color>[
              const Color.fromRGBO(0, 0, 0, 0.8),
              const Color.fromRGBO(0, 0, 0, 0.6),
            ],
            stops: [0.2, 1.0],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ColorLoader3());
    }
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
                  MaterialPageRoute(builder: (context) => SignUpPage()));
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
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 40,
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
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
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
      text: TextSpan(
          text: '',
          style: GoogleFonts.portLligatSans(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Color(0xffD500F9)),
          children: [
            TextSpan(
              text: ' Flutter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w400),
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
        context, MaterialPageRoute(builder: (context) => HomePage()));
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
