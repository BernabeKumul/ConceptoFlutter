import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/shared/widgets/FTLayout.dart';
import 'package:servicio/features/shared/widgets/FTTable.dart';
import 'package:servicio/themes/background.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CrearroductoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CrearroductoPageState();
  }
}

class CrearroductoPageState extends State<CrearroductoPage> {
  BuildContext _context;
  HomeProps _props;
  String nombre;
  String descripcion;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    //props.obtenerProductos(error);
  }

  _crearProducto(HomeProps homeProps) {
    homeProps.crearProducto(
        Producto(
            nombre: nombre,
            descripcion: descripcion,
            urlImg:
                'https://s1.eestatic.com/2017/10/05/actualidad/Actualidad_251989018_130033921_1024x576.jpg'),
        succes,
        showError);
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    File image;

    @override
    void initState() {}

    picker() async {
      print('Picker is called');
      File img = await ImagePicker.pickImage(source: ImageSource.camera);
      print(img.path);
  //  File img = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        image = img;
        setState(() {});
      }
    }

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          bool loading = props.isLoading;
          // List<ProductoModel> productos = props.lstProductos;
          Widget body;
          body = FTLayout(
            loading: loading,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //  alignment: MainAxisAlignment.center,
                            alignment: Alignment.center,
                            // color: colorPrimario,
                            padding: EdgeInsets.all(10),
                            height: 70,
                            width: _media.width - 300,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Crear producto',
                                  style: GoogleFonts.arapey(fontSize: 26),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 60, right: 60, top: 20, bottom: 60),
                            height: _media.height * .60,
                            width: _media.width - 300,
                            child: Column(
                              children: <Widget>[
                                Material(
                                  // elevation: 2.0,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      nombre = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.aspect_ratio,
                                              color: Color(0xff224597)),
                                        ),
                                        hintText: 'Nombre del producto',
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 20.0, 15.0),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 0.0))),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Material(
                                    // elevation: 2.0,
                                    shadowColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(4),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          icon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(Icons.money_off,
                                                color: Color(0xff224597)),
                                          ),
                                          hintText: 'Precio',
                                          fillColor: Colors.grey[100],
                                          filled: true,
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 10.0, 20.0, 15.0),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 0.0))),
                                    )),
                                SizedBox(height: 25),
                                Material(
                                  // elevation: 2.0,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      descripcion = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.edit_location,
                                              color: Color(0xff224597)),
                                        ),
                                        hintText: 'Descripción',
                                        fillColor: Colors.grey[100],
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 20.0, 15.0),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 0.0))),
                                  ),
                                ),
                                SizedBox(height: 25),
                                _submitButton(props, picker),
                                Container(
                                  child: new Center(
                                    child: image == null
                                        ? new Text('No Image to Show ')
                                        : new Image.file(image),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
          return body;
        });
  }

  Widget _submitButton(HomeProps props, Function onClick) => InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: new EdgeInsets.symmetric(vertical: 12),
            width: MediaQuery.of(context).size.width * 0.29,
            padding: EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            color: Colors.blueAccent[200],
            child: Text(
              'Guardar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
      onTap: onClick
      // () {
      // onClick()
      //  onPressed: () {
      // _crearProducto(props);

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
      //props.login(Usuario(email: usuario, password: contrasenia), success, error);
      // print('usuario: ${usuario} contrasenia:${contrasenia}');
      // }
      );

  succes() {
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

  Function showError(String mensaje) {
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
