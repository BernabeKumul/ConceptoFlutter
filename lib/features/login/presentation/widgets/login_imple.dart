import 'package:flutter/material.dart';
import 'package:servicio/features/shared/widgets/FTColorLoader3.dart';

class LoginImple extends StatelessWidget {
  final bool isLoading;
  LoginImple({this.isLoading});
  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    if (isLoading) {
      body = Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            colors: <Color>[
              const Color.fromRGBO(0, 0, 0, .8),
              const Color.fromRGBO(0, 0, 0, .8),
            ],
            stops: [0.2, 1.0],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ColorLoader3());
    }else{
      body = Container();
    }

    return body;
  }
}
