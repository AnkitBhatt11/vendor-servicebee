import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fragment_navigate/navigate-bloc.dart';
// import 'package:fragment_navigate/navigate-support.dart';

import 'package:fragment_navigate/navigate-control.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/constance/constance.dart' as constance;

class PrimaryMainScreen extends StatefulWidget {
  const PrimaryMainScreen({Key? key}) : super(key: key);

  @override
  _PrimaryMainScreenState createState() => _PrimaryMainScreenState();
}

class _PrimaryMainScreenState extends State<PrimaryMainScreen> {
  static FragNavigate? _fragNav;
  static int pageNumber = 0;

  @override
  void initState() {
    super.initState();
    _fragNav = FragNavigate(
      firstKey: 'Home',
      drawerContext: null,
      screens: ConstanceData.screens,
    );

    new Future.delayed(Duration.zero, () {
      _fragNav?.setDrawerContext = context;
      ConstanceData.fragNav = _fragNav;
      // print(ConstanceData.prof.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_fragNav!.stack.length > 1) {
          _fragNav!.jumpBack();
        }
        show();
        return Future.value(false);
      },
      child: StreamBuilder<FullPosit>(
        stream: _fragNav!.outStreamFragment,
        builder: (con, s) {
          if (s.data != null) {
            return Scaffold(
              key: _fragNav!.drawerKey,
              bottomNavigationBar: BottomNavigationBar(
                enableFeedback: true,
                type: BottomNavigationBarType.fixed,
                currentIndex: pageNumber,
                onTap: (num) {
                  print(num);
                  setState(() {
                    pageNumber = num;
                  });
                  if (_fragNav!.currentKey!.toString() !=
                      ConstanceData.screens[pageNumber].key.toString()) {
                    _fragNav!.putPosit(
                      key: ConstanceData.screens[pageNumber].key.toString(),
                    );
                  }
                },
                selectedItemColor: Color(constance.navColorString),
                showUnselectedLabels: true,
                selectedFontSize: 15,
                unselectedFontSize: 15,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: GoogleFonts.roboto(),
                unselectedLabelStyle: GoogleFonts.roboto(),
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: pageNumber == 0
                          ? Icon(Icons.home)
                          : Image.asset(
                              'assets/home.png',
                              scale: 7,
                              color: pageNumber == 0
                                  ? Color(constance.navColorString)
                                  : Colors.black,
                            ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/bee.png',
                      height: 30,
                      width: 30,
                      // color: pageNumber==4?Color(constance.navColorString):Colors.black,
                    ),
                    label: 'Tips',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: pageNumber == 2
                          ? Icon(Icons.query_builder_rounded)
                          : Image.asset(
                              'assets/sent.png',
                              scale: 7,
                              color: pageNumber == 1
                                  ? Color(constance.navColorString)
                                  : Colors.black,
                            ),
                    ),
                    label: 'Query',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: pageNumber == 3
                          ? Icon(Icons.person)
                          : Image.asset(
                              'assets/user.png',
                              scale: 7,
                              color: pageNumber == 3
                                  ? Color(constance.navColorString)
                                  : Colors.black,
                            ),
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
              body: DefaultTabController(
                length: s.data!.bottom!.length,
                child: ScreenNavigate(
                  child: s.data!.fragment,
                  control: _fragNav!,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  setWindow(txt) {
    _fragNav?.putPosit(key: txt);
  }

  show() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: new Text('Yes'),
            ),
          ],
        );
      },
    ).whenComplete(() => Future.value(false));
    return Future.delayed(Duration(seconds: 3), () {
      return Future.value(false);
    });
  }
}
