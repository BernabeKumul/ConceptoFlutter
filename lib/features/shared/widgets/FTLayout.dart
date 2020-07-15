import 'package:flutter/material.dart';
import 'package:servicio/features/login/presentation/widgets/login_imple.dart';
import 'package:servicio/features/shared/widgets/FTSidebarMenu..dart';
import 'package:servicio/themes/background.dart';

import 'FTAppBar.dart';

class FTLayout extends StatefulWidget {
  Widget child;
  bool loading = false;
  FTLayout({Key key, @required this.child, this.loading = false}) : super(key: key);

  @override
  _FTLayoutState createState() => _FTLayoutState();
}

class _FTLayoutState extends State<FTLayout> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Material(
            color: blanco,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SideBarMenu(),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FTAppBar(
                              media: _media,
                              nombre_usuario: "José Bernabé Kumul Kauil",
                            ),
                            Expanded(
                                child: Container(
                              color: Colors.white,
                              margin: EdgeInsets.all(15),
                              width: _media.width - 110,
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[widget.child],
                                ),
                              ),
                            )),
                          ]))
                ])
        ),
        Align(
                  alignment: Alignment.center,
                  child: LoginImple(isLoading: widget.loading),
        )
      ],
    );
  }
}
