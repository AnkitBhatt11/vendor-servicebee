import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_autofill/otp_autofill.dart';
// import 'package:otp_autofill/otp_autofill.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:wellcare/widget/otp_timer.dart';

import '../Networking/AccessNetwork.dart';
import '../main.dart';
import 'EnterPincode.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatefulWidget {
  final phone;

  VerifyScreen(this.phone);

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var otpController = new TextEditingController();
  late OTPTextEditController controller;
  late OTPInteractor otpInteractor;
  var signature = "";
  String txt = '';

  @override
  // void dispose() {
  //   // unregisterListener();
  //   SmsAutoFill().unregisterListener();
  //   super.dispose();
  // }

  // void listen() async {
  //   await SmsAutoFill()
  //       .listenForCode(smsCodeRegexPattern: RegExp('\d{5}[a-zA-Z0-9]').pattern)
  //       .then((value) {
  //     print('listening ');
  //   });
  // }

  // @override
  // void initState() {
  //   SmsAutoFill().getAppSignature.then((sign) {
  //     setState(() {
  //       signature = sign;
  //       print('Sign ${signature}');
  //     });
  //   });
  //   super.initState();
  //   // otpController = new TextEditingController();
  //   animationController = new AnimationController(
  //       vsync: this, duration: Duration(milliseconds: 1000));
  //   animationController..forward();
  //   // listenOtp();
  // }

  Future<void> listenOtp() async {
    otpInteractor = OTPInteractor();
    otpInteractor.getAppSignature().then((value) => {signature = value!});

    controller = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [],
      );
  }

  String? fcmtoken;
  token() async {
    fcmtoken = await firebaseMessaging.getToken();
    print('fcm token : $fcmtoken');
  }

  @override
  void initState() {
    super.initState();
    //   verifyOtpCubit = BlocProvider.of<VerifyOtpCubit>(context);
    listenOtp();
    token();
  }

  Future<void> unregisterListener() async {
    await controller.stopListen();
  }

  // Widget otpField() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: PinCodeTextField(
  //       keyboardType: TextInputType.phone,
  //       controller: otpController,
  //       onChanged: (val) {},
  //       length: 6,
  //       textStyle: const TextStyle(fontSize: 20, color: Colors.black),
  //       enablePinAutofill: true,
  //       enabled: true,
  //       enableActiveFill: true,
  //       pinTheme: PinTheme(
  //           borderRadius: BorderRadius.circular(2),
  //           selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           selectedFillColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           activeColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           activeFillColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           inactiveColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           inactiveFillColor: Theme.of(context).primaryColor.withOpacity(0.1),
  //           fieldHeight: 45,
  //           fieldWidth: 45),
  //       appContext: context,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Text(
                "Enter verification code",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "We have sent you a 6 digit verification code on +91 ${widget.phone}",
                  style: TextStyle(
                      color: Colors.grey.shade700, fontSize: 12, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                keyboardType: TextInputType.phone,
                onChanged: (val) {},
                mainAxisAlignment: MainAxisAlignment.center,
                length: 6,
                textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                enablePinAutofill: true,
                enabled: true,
                enableActiveFill: true,
                controller: controller,
                pinTheme: PinTheme(
                    borderRadius: BorderRadius.circular(6),
                    selectedColor: Colors.grey.shade200,
                    selectedFillColor: Colors.grey.shade200,
                    activeColor: Colors.grey.shade200,
                    activeFillColor: Colors.grey.shade200,
                    inactiveColor: Colors.grey.shade200,
                    inactiveFillColor: Colors.grey.shade200,
                    fieldHeight: 40,
                    fieldWidth: 40,
                    fieldOuterPadding: const EdgeInsets.only(right: 12)),
                appContext: context,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              Row(
                children: [
                  TimeButton(
                    resetTimerOnPressed: true,
                    buttonType: ButtonTyp.FlatButton,
                    label: "Resend OTP",
                    timeOutInSeconds: 29,
                    onPressed: () {
                      send_otp();
                    },
                    disabledColor: Color(0xB3FFFFFF),
                    color: Color(0xB3FFFFFF),
                    disabledTextStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF828282),
                          fontWeight: FontWeight.w500),
                    ),
                    activeTextStyle: TextStyle(
                        fontSize: 13,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  if (controller.text.isNotEmpty &&
                      controller.text.length == 6) {
                    verify_otp();
                  } else {
                    Fluttertoast.showToast(
                        msg: "Enter a valid otp",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  // verifyOtpCubit.verifyOtp(widget.phone);
                },
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                minWidth: double.infinity,
                height: 48,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
    //  Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Container(
    //     constraints: BoxConstraints(
    //         minHeight: MediaQuery.of(context).size.height,
    //         minWidth: MediaQuery.of(context).size.width),
    //     child: Stack(
    //       children: <Widget>[
    //         SingleChildScrollView(
    //           padding: EdgeInsets.all(0.0),
    //           child: SizedBox(
    //             height: MediaQuery.of(context).size.height,
    //             child: Column(
    //               children: <Widget>[
    //                 SizedBox(
    //                   height: (MediaQuery.of(context).size.height / 2) -
    //                       (MediaQuery.of(context).size.width < 360 ? 124 : 86),
    //                 ),
    //                 _loginTextUI(),
    //                 // _emailUI(),
    //                 // otpField(),
    //                 PinFieldAutoFill(
    //                   keyboardType: TextInputType.number,
    //                   cursor: Cursor(color: Colors.black, enabled: true, width: 1),
    //                   autoFocus: true,
    //                   currentCode: txt,
    //                   enableInteractiveSelection: true,
    //                   controller: otpController,
    //                   onCodeSubmitted: (code) {
    //                     if (code.length == 6) {
    //                       // FocusScope.of(context).requestFocus(FocusNode());
    //                       // FocusScope.of(context).requestFocus(FocusNode());
    //                     }
    //                   },
    //                   onCodeChanged: (code) {
    //                     print(code);
    //                     setState(() {
    //                       txt = code!;
    //                     });
    //                     if (code?.length == 6) {

    //                     }
    //                   },
    //                   codeLength:6,
    //                 ),
    //                 TextButton(
    //                   onPressed: () {
    //                     // listen();
    //                     // SmsAutoFill().unregisterListener();
    //                     // listen();
    //                     send_otp();
    //                   },
    //                   child: Text(
    //                     'RESEND OTP',
    //                     style: Theme.of(context).textTheme.bodySmall,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 15,
    //                 ),
    //                 _getVerifyUI(),
    //                 TextButton(
    //                   onPressed: () {
    //                     showAlertDialog(context);
    //                   },
    //                   child: Text(
    //                     'Terms and Privacy',
    //                     style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //                           color: Colors.blue,
    //                         ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: 0,
    //           left: 0,
    //           right: 0,
    //           child: Column(
    //             children: <Widget>[
    //               SizedBox(
    //                 height: MediaQuery.of(context).padding.top,
    //               ),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Terms and Conditions'),
            content: Container(
              height: 150,
              child: Center(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'),
              ),
            ),
          );
        });
      },
    );
  }

  Widget _emailUI() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 25, right: 25),
          child: getOtpTextUI(otptxt: controller.text),
        ),
        Opacity(
          opacity: 0.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: controller,
                            maxLength: 6,
                            onChanged: (String txt) {
                              setState(() {});
                            },
                            onTap: () {},
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: new InputDecoration(
                              errorText: null,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                color: Theme.of(context).disabledColor,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginTextUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16, bottom: 30),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Enter verification code',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'proxima',
                  fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'We have sent you a 6 digit verification code on',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '+91${widget.phone}',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVerifyUI() {
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
              // Navigator.pushReplacementNamed(context, Routes.Home);
              if (controller.text.isNotEmpty && controller.text.length == 6) {
                verify_otp();
              } else {
                Fluttertoast.showToast(
                    msg: "Enter a valid otp",
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
                "I agree",
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

  Widget getOtpTextUI({String otptxt = ""}) {
    var otplist = <Widget>[];
    Widget getUI({String otxt = ""}) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                    color: Theme.of(context).dividerColor, width: 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(otxt, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      );
    }

    for (var i = 0; i < 6; i++) {
      otplist.add(getUI(otxt: otptxt.length > i ? otptxt[i] : "-"));
    }
    return Row(
      children: otplist,
    );
  }

  void verify_otp() {
    access_network().verify_otp(widget.phone, controller.text , fcmtoken).then((_) {
      if (_ == 'otp verified') {
        Fluttertoast.showToast(
            msg: "OTP verified",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);

        Navigator.pushReplacementNamed(context, Routes.Home);
      } else {
        Fluttertoast.showToast(
            msg: "OTP not verified",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  // void send_otp() {
  //   access_network().send_otp(widget.phone, signature).then((_) {
  //     if (_ == 'Otp sent Successfully') {
  //       Fluttertoast.showToast(
  //           msg: "${_}",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.black,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "${_}",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.black,
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   });
  // }

  void send_otp() {
    access_network().send_otp(widget.phone, signature).then((_) {
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
          return VerifyScreen(widget.phone);
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

  void setThePrefs() async {}
}
