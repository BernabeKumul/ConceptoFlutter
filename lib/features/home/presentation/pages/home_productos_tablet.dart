import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/pages/crear_producto_tablet.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/home/presentation/widgets/simple_round_icon_button.dart';

class HomeProductosTabletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageProductosTabletState();
  }
}

class HomePageProductosTabletState extends State<HomeProductosTabletPage> {
  BuildContext _context;
  HomeProps _props;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    props.obtenerProductos(showError);
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
          _context = context;
          _props = props;
          bool loading = props.isLoading;
          // bool loading =  false;
          List<ProductoModel> productos = props.lstProductos;
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
              // backgroundColor: Color(0xFFFCFAF8),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/homeTablet');
                          },
                        ),
                        SimpleRoundIconButton(
                          backgroundColor: Colors.blue,
                          buttonText: Text(
                            "Productos",
                            style: TextStyle(color: Colors.blue),
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
                                    OutlineButton(
                                        child: Text("Nuevo"),
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        color: Colors.black,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CrearProdoductoTablePage()));
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
                              Expanded(
                                child: Container(
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
                                  width:
                                      MediaQuery.of(context).size.width * .75,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      DataTable(
                                          // sortColumnIndex: 1,
                                          // sortAscending: true,
                                          // onSelectAll: (bool value) {},
                                          columns: const <DataColumn>[
                                            DataColumn(
                                              label: Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Nombre',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                'Descripción',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                             DataColumn(
                                              label: Text(
                                                'Activo',
                                                style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            DataColumn(
                                              label: Text(
                                                ' ',
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            )
                                          ],
                                          rows: productos
                                              .map(
                                                (itemRow) => DataRow(
                                                  onSelectChanged:
                                                      (bool selected) {
                                                    if (selected) {}
                                                  },
                                                  cells: [
                                                    DataCell(Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Image.network(
                                                            itemRow.urlImg,
                                                            width: 70,
                                                            height: 70))),
                                                    DataCell(
                                                        Text(itemRow.nombre)),
                                                    DataCell(Text(
                                                        itemRow.descripcion)),
                                                    DataCell(
                                                      Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green[300],
                                                      )
                                                      ),
                                                    DataCell(Row(
                                                      children: <Widget>[
                                                        InkWell(
                                                            onTap: () {
                                                              _confirm(itemRow
                                                                  .productoId);
                                                            },
                                                            child: Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .indigo,
                                                                size: 22)),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              _confirm(itemRow
                                                                  .productoId);
                                                            },
                                                            child: Icon(
                                                                Icons
                                                                    .delete_outline,
                                                                color:
                                                                    Colors.red,
                                                                size: 22))
                                                      ],
                                                    ))
                                                  ],
                                                ),
                                              )
                                              .toList())
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            );
          }
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
