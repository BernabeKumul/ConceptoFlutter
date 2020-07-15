import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/pages/productos_list.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/themes/background.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  
File image;
  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    props.obtenerProductos(showError);
  }

    galeria() async {
      print('Picker is called');
      // File img = await ImagePicker.pickImage(source: ImageSource.camera);
      // print(img.path);
   File img = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        image = img;
        setState(() {});
      }
    }

    camara() async {
      print('Picker is called');
      // File img = await ImagePicker.pickImage(source: ImageSource.camera);
      // print(img.path);
   File img = await ImagePicker.pickImage(source: ImageSource.camera);
      if (img != null) {
        image = img;
        setState(() {});
      }
    }
    
  Function showError(String mensaje) {}

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          bool loading = false;
          Widget body;
          if (loading) {
            body = Scaffold(
                body: Container(
                    color: Colors.indigo,
                    child: Stack(children: <Widget>[
                      Stack(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    child: new CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  "  Cargando \n Productos..",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ])));
          } else {
            body = Scaffold(
                appBar: AppBar(
                  title: Text('Acceso a camara & galeria'),
                ),
                drawer: Drawer(
                    child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://concepto.de/wp-content/uploads/2019/12/paisaje-rural-e1576119288479.jpg")),
                      title: Text("José Kauil"),
                      subtitle: Text("jbrkauil@gmail.com"),
                    ),
                    ListTile(leading: Icon(Icons.home), title: Text("Inicio")),
                    ListTile(
                        leading: Icon(Icons.account_box),
                        title: Text('Perfil')
                        ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Salir"),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ],
                )),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, '/crearProducto');
                  },
                  label: Text('Enviar'),
                  icon: Icon(Icons.add_circle_outline),
                  backgroundColor: Colors.blueAccent,
                ),
                body: Container(
                    color: Colors.white,
                    child: Stack(children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            // color: Colors.blue,
                            height: _media.height * .50,
                                  child: new Center(
                                    child: image == null
                                        ? new Text('Elegir imagen')
                                        : new Image.file(image, fit: BoxFit.cover, width: _media.width ,),
                                  ),
                                ),
                      // ProductosPage()
                      _submitButton(null, galeria, "Galeria"),
                      _submitButton(null, camara, "Camara"),
                        ],
                      )
                      ])));
          }
          return body;
        });
  }
  Widget _submitButton(HomeProps props, Function onClick, String title) => InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            margin: new EdgeInsets.symmetric(vertical: 12),
            width: MediaQuery.of(context).size.width * 0.59,
            padding: EdgeInsets.symmetric(vertical: 14),
            alignment: Alignment.center,
            color: colorPrimario,
            child: Text(
              title,
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
}
