import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/shared/widgets/FTOption.dart';
import 'package:servicio/features/shared/widgets/FTLayout.dart';

import 'productos_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  BuildContext _context;
  HomeProps _props;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {}

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        builder: (context, props) {
          Widget body;
          body = FTLayout(
            child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[_opciones()]),
          ));
          return body;
        });
  }

  Widget _opciones() => Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          IntrinsicHeight(
            child: Row(children: <Widget>[
              Option(
                title: 'Usuarios',
                color: Colors.indigo,
                icon: Icons.people,
                onClick: () {},
              ),
              Option(
                title: 'Productos',
                color: Colors.blue,
                icon: Icons.chrome_reader_mode,
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductoPage()));
                },
              ),
              Option(
                title: 'Ventas',
                color: Colors.red,
                icon: Icons.content_paste,
                onClick: () {},
              ),
              Option(
                title: 'Pedido',
                color: Colors.green,
                icon: Icons.shop,
                onClick: () {},
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      );
}

class HomeTabletProductoUxPage {
}
