// ignore_for_file: deprecated_member_use

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/main.dart';

import '../Networking/AccessNetwork.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    myContext = context;

    _loadNextScreen();
    super.initState();
  }

  late BuildContext myContext;
  _loadNextScreen() async {
    if (!mounted) return;

    await Future.delayed(const Duration(seconds: 3));
    // Navigator.pushReplacementNamed(context, Routes.Loading);
    if (!await getSharedPreferences()) {
      Navigator.pushReplacementNamed(context, Routes.GETSTARTED);
    } else {
      await getProfileData();
      Navigator.pushReplacementNamed(context, Routes.Home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Animator<double>(
              duration: Duration(milliseconds: 1000),
              cycles: 1,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (_, anim, __) => Transform.scale(
                origin: Offset(-5, 5),
                scale: anim.value,
                child: Container(
                  height: 300,
                  width: 350,
                  child: Image.asset(
                    ConstanceData.appicon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            SizedBox(
              height: 24,
            ),

          ],
        ),
      ),
    );
  }

  Future<bool> getSharedPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data =prefs.getBool('logged_in');
    return  data==null?false:data;
  }

  Future getProfileData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data =prefs.getString('access_token');
    print(data);
    if(data!=null){
      ConstanceData.setAccessToken(data);
    }
  }


}
