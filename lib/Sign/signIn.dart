import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:otp_autofill/otp_autofill.dart';
import 'package:wellcare/Sign/verifyScreen.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Networking/AccessNetwork.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  // late OTPInteractor otpInteractor;

  // Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('US');
  bool isSignUp = true;
  String phoneNumber = '';
  String countryCode = "+91";
  var phoneController = new TextEditingController();
  String signature = '';

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animationController..forward();
    // otpInteractor = OTPInteractor();
    // otpInteractor.getAppSignature().then((value) => {
    // signature = value!
    // });
    SmsAutoFill().getAppSignature.then((sign) {
      setState(() {
        signature = sign;
        print('Sign ${signature}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.all(0.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    Container(
                      height: 150,
                      width: 200,
                      child: Image.asset(
                        ConstanceData.appicon,
                        fit: BoxFit.fill,
                      ),
                    ),
                    _loginTextUI(),
                    _countryView(),
                    _getSignUpButtonUI(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 30),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'By continuing you are agreeing to',
                              style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'our terms of use and privacy policy',
                              style: GoogleFonts.roboto(
                                color: Colors.black45,
                                fontSize: 14,
                              ),
                            ),
                          ],
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
    );
  }

  Widget _loginTextUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 16, bottom: 20),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Mobile Number',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'proxima',
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _countryView() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Theme.of(context).dividerColor, width: 0.6),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 60,
              child: Center(child: Text('+91')),
            ),
            Container(
              color: Theme.of(context).dividerColor,
              height: 32,
              width: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 16),
                child: Container(
                  color: Colors.white,
                  height: 48,
                  child: TextField(
                    controller: phoneController,
                    maxLines: 1,
                    onChanged: (String txt) {
                      phoneNumber = txt;
                    },
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: new InputDecoration(
                      errorText: null,
                      border: InputBorder.none,
                      hintText: " Phone Number",
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  late AlertDialog alert;
  showLoaderDialog(BuildContext context) {
    alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _getSignUpButtonUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
            highlightColor: Colors.transparent,
            onTap: () {
              if (phoneController.text.isNotEmpty &&
                  phoneController.text.length == 10) {
                showLoaderDialog(context);
                send_otp();
              } else {
                Fluttertoast.showToast(
                    msg: "Enter a valid mobile phone number",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            child: Center(
              child: Text(
                'Next',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getCountryString(String str) {
    var newString = '';
    var isFirstdot = false;
    for (var i = 0; i < str.length; i++) {
      if (isFirstdot == false) {
        if (str[i] != ',') {
          newString = newString + str[i];
        } else {
          isFirstdot = true;
        }
      }
    }
    return newString;
  }

  void send_otp() {
    access_network().send_otp(phoneController.text, signature).then((_) {
      if (_ == 'Otp sent Successfully') {
        Fluttertoast.showToast(
            msg: "${_}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return VerifyScreen(phoneController.text);
        }));
      } else {
        Fluttertoast.showToast(
            msg: "${_}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }
}
