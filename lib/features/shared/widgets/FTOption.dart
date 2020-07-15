import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String title;
  final IconData icon;
  final MaterialColor color;
  final Function onClick;

  Option(
      {
        this.title,
        this.color,
        this.icon,
        this.onClick
      });

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    double _sizeCard = deviceInfo.orientation == Orientation.landscape
        ? deviceInfo.size.height * .20
        : deviceInfo.size.height * .15;

    return Card(
      margin: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onClick,
        splashColor: Colors.lime[100],
        child: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 70.0, color: color,),
              Text(title, style: TextStyle(fontSize: 17.0))
            ],
          ),
          )
        ),
      ),
    );
  }  
}