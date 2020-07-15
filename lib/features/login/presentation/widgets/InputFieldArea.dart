import 'package:flutter/material.dart';
import 'package:servicio/themes/background.dart';


class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  void Function(String texto) change;
  InputFieldArea({this.hint, this.obscure, this.icon, this.change});
  @override
  Widget build(BuildContext context) {
    return (new Container(
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
      ),
      child: new TextFormField(
        obscureText: obscure,
        style: const TextStyle(color: Colors.black, fontSize: 19),
        decoration: new InputDecoration(
          icon: new Icon(
            icon,
            color: colorPrimario,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 15.0, left: 5.0),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
        },
        onChanged: (value) {
          // print(value);
          change(value);
        },
      ),
    ));
  }
}
