import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/home/presentation/widgets/card.dart';

class ProductosPage extends StatelessWidget {
  ProductosPage({Key key}) : super(key: key);
  BuildContext _context;
  HomeProps _props;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        distinct: true,
        builder: (_, props) {
          _context = context;
          _props = props;
          List<ProductoModel> albums = props.lstProductos;
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .80,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Mis Productos',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 16)),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                            itemCount: albums.length,
                            itemBuilder: (context, i) =>
                                _card(context, albums[i])),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Function _confirm(String id) {
    Alert(
      context: _context,
      type: AlertType.warning,
      title: "Eliminar",
      desc: "¿Esta seguro que desea eliminar este registro?",
      buttons: [
        DialogButton(
          child: Text(
            "Cancelar",
            style: TextStyle( fontSize: 20),
          ),
          onPressed: () => Navigator.pop(_context),
          color: Colors.grey[300],
        ),
        DialogButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(_context);
            _props.desactivarProducto(id, success, showError);
          }, 
          color: Colors.blue,
        )
      ],
    ).show();
  }

  Function showError(String mensaje){
    Alert(context: _context, title: "Error", desc: mensaje).show();
  }

  Function success() {
    Alert(
      context: _context,
      type: AlertType.success,
      title: "Eliminación",
      desc: "El registro se ha eliminado correctamente.",
      buttons: [
        DialogButton(
          child: Text(
            "Acceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed:() {
            Navigator.of(_context).pop();
          },
          width: 120,
          color: Colors.blue,
        )
      ],
    ).show();
  }

  Widget _card(BuildContext context, ProductoModel album) {
    return Column(
      children: <Widget>[
        CardHome(
            id: album.productoId,
            title: album.nombre,
            subtitle: album.descripcion,
            img: album.urlImg,
            cambiarStatusFunction: _confirm),
        SizedBox(height: 15)
      ],
    );
  }
}
