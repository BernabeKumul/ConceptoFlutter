import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/pages/crear_producto_tablet.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/shared/widgets/FTOption.dart';
import 'package:servicio/features/home/presentation/widgets/simple_round_icon_button.dart';
import 'package:servicio/features/login/presentation/pages/loginPageTablet.dart';

import 'home_productos_tablet.dart';

class HomeTabletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageTabletState();
  }
}

class HomePageTabletState extends State<HomeTabletPage> {
  BuildContext _context;
  HomeProps _props;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    // props.obtenerProductos(showError);
  }

  // Function showError(String mensaje) {}

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {}

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          Widget body;
          
            body = Scaffold(
              // backgroundColor: Colors.grey[200],
              body: Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.black87,
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        _logo(),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.blue,
                          buttonText: Text(
                            "Home",
                            style: TextStyle(color: Colors.blue),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.home),
                          onPressed: () {
                            // Navigator.pushNamed(context, '/homeTablet');
                          },
                        ),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.white,
                          buttonText: Text(
                            "Productos",
                            style: TextStyle(color: Colors.white),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.people),
                          onPressed: () {},
                        ),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.white,
                          buttonText: Text(
                            "Salir",
                            style: TextStyle(color: Colors.white),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.exit_to_app),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: MediaQuery.of(context).size.width * .75,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              bottom: 2, top: 20, right: 15, left: 20),
                          width: MediaQuery.of(context).size.width * .75,
                          height: MediaQuery.of(context).size.height * .10,
                          color: Colors.black87,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.chevron_left,
                                  color: Colors.white, size: 30),
                              // Expanded(child: Text("buscador..")),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * .75,
                          height: MediaQuery.of(context).size.height * .87,
                          color: Colors.grey[100],
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .75,
                                height: 50,
                                // color: Colors.yellow,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    // OutlineButton(
                                    //     child: Text("Nuevo"),
                                    //     borderSide:
                                    //         BorderSide(color: Colors.red),
                                    //     color: Colors.black,
                                    //     onPressed: () {
                                    //       Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (context) =>
                                    //                   CrearProdoductoTablePage()));
                                    //     },
                                    //     shape: RoundedRectangleBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(5.0))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Option(
                                    title: 'Home',
                                    color: Colors.orange,
                                    icon: Icons.home,
                                    onClick: (){},
                                  ),
                                  Option(
                                    title: 'Usuarios',
                                    color: Colors.indigo,
                                    icon: Icons.people,
                                    onClick: (){},
                                  ),
                                  Option(
                                    title: 'Productos',
                                    color: Colors.blue,
                                    icon: Icons.chrome_reader_mode,
                                    onClick: () {
                                      Navigator.pushNamed(
                                          context, '/ProductoTablet');
                                    },
                                  ),
                                  Option(
                                    title: 'Inventario',
                                    color: Colors.red,
                                    icon: Icons.content_paste,
                                    onClick: (){},
                                  ),
                                  Option(
                                    title: 'Configuración',
                                    color: Colors.grey,
                                    icon: Icons.widgets,
                                    onClick: (){},
                                  ),
                                ],
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            );
          return body;
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
            style: TextStyle(fontSize: 20),
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

  Function showError(String mensaje) {
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
          onPressed: () {
            Navigator.of(_context).pop();
          },
          width: 120,
          color: Colors.blue,
        )
      ],
    ).show();
  }

  Widget _logo() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * .24,
      height: MediaQuery.of(context).size.width * .20,
      child: Stack(
        children: <Widget>[
          Image.asset('assets/img/logo2.png')
          // Text('F l u t t e r',
          //     style: GoogleFonts.luckiestGuy(
          //         textStyle: Theme.of(context).textTheme.display1,
          //         fontSize: 40,
          //         color: Colors.white))
        ],
      ),
    );
  }
}
