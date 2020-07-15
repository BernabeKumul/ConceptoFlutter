import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicio/features/home/presentation/pages/HomeProps.dart';
import 'package:servicio/features/home/presentation/store/models/app_state.dart';
import 'package:servicio/features/shared/widgets/FTDropDown.dart';
import 'package:servicio/features/shared/widgets/FTLayout.dart';
import 'package:servicio/themes/background.dart';

class PerfilUsuarioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilUsuarioPageState();
  }
}

class PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  BuildContext _context;
  HomeProps _props;

  @override
  void initState() {
    super.initState();
  }

  void handleInitialBuild(HomeProps props) {
    // props.obtenerProductos(showError);
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    List<Icon> icons = [
      Icon(Icons.person),
      Icon(Icons.settings),
      Icon(Icons.credit_card),
    ];
    @override
    void initState() {}

    return StoreConnector<AppState, HomeProps>(
        converter: (store) => mapToProps(store),
        onInitialBuild: (props) => this.handleInitialBuild(props),
        builder: (context, props) {
          Widget body;
          body = FTLayout(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Expanded(
                    child: Container(
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              IntrinsicHeight(
                                child: Row(
                                  children: <Widget>[
                                    Material(
                                      // elevation: 10,
                                      shadowColor: Colors.grey,
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.white,
                                      child: Container(
                                        // flex: 1,
                                        height: _media.height - 190,
                                        width: _media.width - 320,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    topRight:
                                                        Radius.circular(4),
                                                  ),
                                                ),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        Expanded(
                                                          flex: 8,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: NetworkImage(
                                                                    'https://sfwallpaper.com/images/4k-uhd-wallpapers-3.jpg'),
                                                                // backgroundColor: Color(0xFF009688),
                                                                // radius: _animation.value >= 250 ? 30 : 20,
                                                                // ),
                                                              ),
                                                              color:
                                                                  Colors.grey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(),
                                                        ),
                                                      ],
                                                    ),
                                                    Positioned(
                                                      bottom: 20,
                                                      child: Container(
                                                        height: 120,
                                                        width: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image:
                                                                    DecorationImage(
                                                                  image: NetworkImage(
                                                                      'https://pbs.twimg.com/profile_images/1215745528337772551/bCEG_W-i_400x400.jpg'),
                                                                )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'Jose Bernabe Kumul Kauil',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Web Designer & Developer',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Lorem ipsum dolor sit amet, this is a consectetur adipisicing elit',
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Container(
                                                      height: 45,
                                                      width: 120,
                                                      child: RaisedButton(
                                                        color:
                                                            Color(0xFF009688),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        onPressed: () =>
                                                            print('Editar'),
                                                        child: Text(
                                                          'Editar ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ]));
          return body;
        });
  }
}
