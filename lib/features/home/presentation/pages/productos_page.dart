import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:servicio/features/home/data/models/producto_model.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/shared/widgets/FTLayout.dart';
import 'package:servicio/features/shared/widgets/FTTable.dart';
import 'package:servicio/themes/background.dart';

import 'crear_producto_page.dart';

class ProductoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductoPageState();
  }
}

class ProductoPageState extends State<ProductoPage> {
  BuildContext _context;
  HomeProps _props;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    props.obtenerProductos(error);
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    @override
    void initState() {}

    void _showModalSheet() {
      showModalBottomSheet(
        isScrollControlled: true,
      // isDismissible: true,
      
          context: context,
          builder: (builder) {
            return Container(
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
                                      // nombre = value;
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
                                      // descripcion = value;
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
                                // _submitButton(props)
                              ],
                            ),
                          ),
                        ],
                      )
            );
    }
    );
    }

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          bool loading = props.isLoading;
          List<ProductoModel> productos = props.lstProductos;
          Widget body;
          var dts = DTS();
          int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
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
                            // color: Colors.black,
                            padding: EdgeInsets.all(10),
                            height: 130,
                            width: _media.width - 140,
                            child: Column(
                              children: <Widget>[
                                _busqueda(),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    // color: Colors.blue,
                                    margin: EdgeInsets.only(left: 40),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton(
                                          onPressed: _showModalSheet,
                                          // () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             CrearroductoPage()));
                                          // },
                                          child: Icon(Icons.filter_list,
                                              size: 40, color: colorPrimario),
                                        ),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CrearroductoPage()));
                                          },
                                          child: Icon(Icons.add_circle,
                                              size: 40, color: colorPrimario),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              margin: EdgeInsets.only(right: 10, left: 10),
                              height: 480,
                              width: _media.width - 150,
                              child: SingleChildScrollView(
                                  child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'IMAGEN',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      // SizedBox(width: 10,),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'NOMBRE',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      // SizedBox(width: 10,),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'DESCRIPCIÓN',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      // SizedBox(width: 10,),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          'ESTATUS',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Text(
                                        '                           ',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: productos.length,
                                      itemBuilder: (context, index) {
                                        return _row(productos[index]);
                                      })
                                ],
                              )
                                  // PaginatedDataTable(

                                  //   // actions: <Widget>[
                                  //   //   Text("data"),
                                  //   //   Text("data"),
                                  //   //   Text("data")
                                  //   // ],
                                  //   // columnSpacing: 200,

                                  //   // headingRowHeight: 100,
                                  //         header: Text("Productos"),
                                  //         columns: [
                                  //           DataColumn(label: Text("col#1")),
                                  //           DataColumn(label: Text("col#2")),
                                  //           DataColumn(label: Text("col#3")),
                                  //           DataColumn(label: Text("col#4"))
                                  //         ],
                                  //         source: dts,
                                  //         onRowsPerPageChanged: (r) {
                                  //           setState(() {
                                  //             _rowPerPage = r;
                                  //           });
                                  //         },
                                  //         rowsPerPage: _rowPerPage,
                                  //       ),

                                  ))
                        ],
                      ))
                ],
              ),
            ),
          );
          return body;
        });
  }

  Widget _busqueda() => Material(
        // elevation: 2.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          onChanged: (value) {
            // nombre = value;
          },
          decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Color(0xff224597)),
              ),
              hintText: 'Nombre del producto',
              border: InputBorder.none,
              fillColor: Colors.grey[100],
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 15.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.white, width: 0.0))),
        ),
      );

  Widget _toolbar() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Text(''),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CrearroductoPage()));
              },
              child: Icon(Icons.add_circle, size: 45, color: Colors.green[900]),
            ),
            FlatButton(
              onPressed: () {
                // _filtros(context);
              },
              child:
                  Icon(Icons.filter_list, size: 45, color: Colors.green[900]),
            )
          ],
        )
      ]);

  Widget _row(ProductoModel row) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 200,
                child: Image.network(
                  row.urlImg,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 120,
                ),
              ),
              Container(
                width: 200,
                child: Text(
                  row.nombre,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey[900]),
                ),
              ),
              Container(
                width: 200,
                child: Text(row.descripcion,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey[900])),
              ),
              Container(
                width: 100,
                child: Container(
                  child: Text(
                    'Activo',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  height: 30,
                  width: 80,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Container(
                  width: 200,
                  child: FlatButton(
                    onPressed: () {
                      // _filtros(context);
                    },
                    child: Icon(Icons.edit, size: 30, color: Colors.red),
                  )),
              // SizedBox(height: 20),
            ],
          ),
          SizedBox(height: 10)
        ],
      );

  Widget _column(String title) => Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.grey[900]),
      );

  Function error(String mensaje) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Consultar Producto",
      desc: mensaje,
      buttons: [
        DialogButton(
          child: Text(
            "Acceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }
}

class DTS extends DataTableSource {
  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("#cell$index")),
      DataCell(Text("#cel2$index")),
      DataCell(Text("#cel3$index")),
      DataCell(Text("#cel4$index"))
    ]);
  }
}
