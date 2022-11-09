import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Networking/AccessNetwork.dart';
import '../constance/constance.dart';
import '../main.dart';

class EnterDetails extends StatefulWidget {
  final String phone;

  EnterDetails(this.phone);

  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  // Country _selectedCountry = CountryPickerUtils.getCountryByIsoCode('US');
  bool isSignUp = true;
  String name = '';

  // FirebaseAuth auth = FirebaseAuth.instance;
  var items = [
    'Gurgaon',
    'Delhi',
    'Mumbai',
  ];

  String dropdownvalue =  'Gurgaon';

  var pincodeController=TextEditingController();
  @override
  void initState() {
    super.initState();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _loginTextUI(),
                    _countryView(),
                    _getSignUpButtonUI(),
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
          padding:
              const EdgeInsets.only(left: 24, right: 16, top: 30, bottom: 30),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Enter Pincode',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'proxima',
                  fontSize: 25
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(
                height: 58,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 0.6),
                ),
                child: Center(
                  child: TextField(
                    controller: pincodeController,
                    maxLength: 6,
                    onChanged: (String txt) {
                      name = txt;
                    },
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: new InputDecoration(
                      counterText: "",
                      errorText: null,
                      border: InputBorder.none,
                      hintText: "Enter Pincode",
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor),
                      icon: Image.asset(
                        'assets/pin.png',
                        scale: 3,
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 58,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: Theme.of(context).dividerColor, width: 0.6),
                ),
                width: 500,
                child: Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSignUpButtonUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
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
              if (pincodeController.text.isNotEmpty&&pincodeController.text.length==6) {
               update();
              } else {
                Fluttertoast.showToast(
                    msg: "Enter a valid pincode",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
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

  void update() {
    access_network().update_pincity(pincodeController.text.toString(),dropdownvalue.toString()).then((_){
      if (_=='Pincode and City updated successfully!') {
        setState(() {
                ConstanceData.pincode=pincodeController.text;
                ConstanceData.city=dropdownvalue;
              });
        Fluttertoast.showToast(
                  msg: "${_}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
        Navigator.pushReplacementNamed(context, Routes.Home);
      } else {
        Fluttertoast.showToast(
            msg: "${_}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }
}
