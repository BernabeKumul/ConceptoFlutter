import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/domain/Entities/producto.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/home/presentation/widgets/crear_producto_tablet_controls.dart';
import 'package:servicio/features/home/presentation/widgets/simple_round_icon_button.dart';
// import 'package:toast/toast.dart';

class CrearProdoductoTablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CrearProdoductoPageTabletState();
  }
}

class CrearProdoductoPageTabletState extends State<CrearProdoductoTablePage> {
  String nombre;
  String descripcion;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    // props.obtenerProductos();
  }

   _crearProducto(HomeProps homeProps){
    homeProps.crearProducto(
      Producto(nombre: nombre,
       descripcion: descripcion,
       urlImg: 'https://s1.eestatic.com/2017/10/05/actualidad/Actualidad_251989018_130033921_1024x576.jpg')
      , succes, showError);
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
                          backgroundColor: Colors.white,
                          buttonText: Text(
                            "Home",
                            style: TextStyle(color: Colors.white),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.home),
                        ),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.blue,
                          buttonText: Text(
                            "Productos",
                            style: TextStyle(color: Colors.blue),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.people),
                        ),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.white,
                          buttonText: Text(
                            "Inventario",
                            style: TextStyle(color: Colors.white),
                          ),
                          textColor: Colors.white,
                          icon: Icon(Icons.insert_drive_file),
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
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .75,
                                height: 50,
                                // color: Colors.yellow,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(''),
                                    OutlineButton(
                                        child: Text("Cancelar"),
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        color: Colors.black,
                                        onPressed: () {
                                           Navigator.pop(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0))),
                                    SizedBox(width: 10,),
                                    OutlineButton(
                                        child: Text("Guardar"),
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                        color: Colors.black,
                                        onPressed: () {
                                          _crearProducto(props);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                               Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, .5),
                                          blurRadius: 1, // soften the shadow
                                        ),
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.4, 5.0),
                                          blurRadius: 3.0,
                                        )
                                      ]),
                                  width: MediaQuery.of(context).size.width * .75,
                                   height: MediaQuery.of(context).size.height * .78,
                                  child: Container(
                                      padding: EdgeInsets.all(20),
                                      width: 100,
                                      height: 100,
                                      // color: Colors.blue,
                                      child: CrearProductoTabletControls(
                                          setValueNombre: changeNombre,
                                          setValueDescripcion: changeDescipcion,
                                      ) ,
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )));
          // }
          return body;
        });
  }

  Function changeNombre(String text){
    this.nombre = text;
  }

  Function changeDescipcion(String text){
    this.descripcion = text;
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

   succes(){
    Alert(
      context: context,
      type: AlertType.success,
      title: "Guardar",
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
