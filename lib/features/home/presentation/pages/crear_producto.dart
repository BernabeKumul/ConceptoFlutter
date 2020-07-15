import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/home/presentation/widgets/crear_producto_controls.dart';
// import 'package:toast/toast.dart';

class CrearProdoductoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CrearProdoductoPageState();
  }
}

class CrearProdoductoPageState extends State<CrearProdoductoPage> {
  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    // props.obtenerProductos();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          bool loading = props.isLoading;
          // bool load = store;
          Widget body;
          body = Scaffold(
              appBar: AppBar(
                title: Text('Crear Producto'),
              ),
              body: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  color: Colors.white,
                  child: Stack(children: <Widget>[CrearProductoControls()])));
          // }
          return body;
        });
  }
}
