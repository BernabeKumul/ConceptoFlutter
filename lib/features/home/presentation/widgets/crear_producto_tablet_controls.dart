import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';

class CrearProductoTabletControls extends StatefulWidget {
  final Function (String text) setValueNombre;
  final Function(String text) setValueDescripcion;

  const CrearProductoTabletControls({
    Key key,
    this.setValueDescripcion,
    this.setValueNombre
  }) : super(key: key);

  @override
  _CrearProductoTabletControlsState createState() => _CrearProductoTabletControlsState();
}

class _CrearProductoTabletControlsState extends State<CrearProductoTabletControls> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  String nombre;
  String descripcion;
  

  _crearProducto(HomeProps homeProps){
    homeProps.crearProducto(
      Producto(nombre: nombre,
       descripcion: descripcion,
       urlImg: 'https://s1.eestatic.com/2017/10/05/actualidad/Actualidad_251989018_130033921_1024x576.jpg')
      , succes, showError);
    controller1.clear();
    controller2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return 
    StoreConnector<AppState, HomeProps>(
      converter: (store) => mapToProps(store),
      builder:(context, props) {
        return  Column(
      children: <Widget>[
        TextField(
          controller: controller1,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nombre',
          ),
          onChanged: (value) {
            // nombre = value;
             widget.setValueNombre(value);
          },
          onSubmitted: (_) {
            // dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller2,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Descripción',
          ),
          onChanged: (value) {
            // descripcion = value;
            widget.setValueDescripcion(value);
          },
          onSubmitted: (_) {
            //  Navigator.pushNamed(context, '/');
          },
        ),
      ],
    );
      });
  }

   succes(){
    Alert(
      context: context,
      type: AlertType.success,
      title: "Información",
      desc: "El producto se guardo correctamente.",
      buttons: [
        DialogButton(
          child: Text(
            "Acceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           Navigator.pop(context);
           Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
  
  Function showError(String mensaje){
 Alert(
      context: context,
      type: AlertType.error,
      title: "Información",
      desc: "Surgio un error al guardar el producto.",
      buttons: [
        DialogButton(
          child: Text(
            "Acceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
           Navigator.pop(context);
           Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

}
