import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicio/features/home/presentation/pages/home.dart';
import 'package:servicio/features/login/presentation/widgets/InputFieldArea.dart';
import 'package:servicio/themes/background.dart';

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SigUpPageState createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SignUpPage> {

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
    return Scaffold(
        body: 
           SingleChildScrollView(
             child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
              image: backgroundLogin,),
              child: 
                  Container(
                  decoration: borderLogin,
                    child: Stack(
                      children: <Widget>[
                      Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _title(),
                              SizedBox(height: 10),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text('Crear cuenta', style: TextStyle(
                                color: Colors.white54),
                              )),
                              FormContainer(),
                              SizedBox(height: 20),
                              _submitButton(),
                            ],
                          ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: _loginAccountLabel(),
                        ),
                         Positioned(top: 40, left: 0, child: _backButton())
                      ],
                    ),
                ),
           )
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
            'Ya cuenta con una cuenta ?',
            style: TextStyle(fontSize: 13, color: Colors.white54),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Ingresar',
              style: TextStyle(
                  color: Color(0xfff57C00), //0xff4db6ac
                  fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
 Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white54),
            ),
            Text('Regresar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white54))
          ],
        ),
      ),
    );
  }

Widget _submitButton() {
    return InkWell(
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 40,
              margin:  EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF42AA5F5), Color(0xFF3949AB)])),
              child: Text(
                'Registrar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        });
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
}

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Form(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new InputFieldArea(
                hint: "Correo",
                obscure: false,
                icon: Icons.person_outline,
              ),
              new InputFieldArea(
                hint: "Contraseña",
                obscure: true,
                icon: Icons.lock_outline,
              ),
              new InputFieldArea(
                hint: "Confirmar Contraseña",
                obscure: true,
                icon: Icons.lock_outline,
              ),
            ],
          )),
        ],
      ),
    ));
  }
}