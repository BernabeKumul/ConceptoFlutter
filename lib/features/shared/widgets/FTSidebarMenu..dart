import 'package:flutter/material.dart';
import 'package:servicio/themes/background.dart';

import 'models/menu.dart';
import 'models/menu_item_tile.dart';

class SideBarMenu extends StatefulWidget {
  @override
  _SideBarMenuState createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidgth = 70;
  bool collapsed = true;
  int selectedIndex = 0;

  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation = Tween<double>(begin: minWidgth, end:maxWidth )
        .animate(_animationController);
  }

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black26, spreadRadius: 2)
            ],
            color: Colors.black,
          ),
          width: _animation.value,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  setState(() {
                    collapsed = !collapsed;
                    collapsed
                        ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 30,),
              // Container(
              //   height: 200,
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     height: 100,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: <Widget>[
              //             CircleAvatar(
              //               backgroundImage: NetworkImage(
              //                   'https://e7.pngegg.com/pngimages/255/69/png-clipart-software-development-computer-icons-mobile-app-development-technology-technology-angle-electronics.png'),
              //               backgroundColor: Colors.white,
              //               radius: _animation.value >= 250 ? 30 : 20,
              //             ),
              //             SizedBox(
              //               width: _animation.value >= 250 ? 20 : 0,
              //             ),
              //             (_animation.value >= 250)
              //                 ? Text('Desarrollo Movil',
              //                     style: menuListTileDefaultText)
              //                 : Container(),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, counter) {
                    return Divider(
                      height: 2,
                    );
                  },
                  itemCount: menuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MenuItemTile(
                      title: menuItems[index].title,
                      icon: menuItems[index].icon,
                      animationController: _animationController,
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
