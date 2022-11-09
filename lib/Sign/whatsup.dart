import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellcare/Sign/signUp.dart';
import 'package:wellcare/Sign/verifyScreen.dart';
import 'package:wellcare/main.dart';

class WhatsupLoginScreen extends StatefulWidget {
  @override
  _WhatsupLoginScreenState createState() => _WhatsupLoginScreenState();
}

class _WhatsupLoginScreenState extends State<WhatsupLoginScreen> {
  String countryCode = "91";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).padding.top + 10,
                  color: Theme.of(context).primaryColor,
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(65),
                          bottomRight: Radius.circular(65),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, Routes.Loading);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).backgroundColor,
                                    ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1.5,
                              width: 80,
                              color: Colors.black38,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Or",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    letterSpacing: 0.1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black38,
                                  ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Container(
                              height: 1.5,
                              width: 80,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 65,
                              width: 150,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 10),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.deepPurple[100],
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.facebookSquare,
                                          color: Theme.of(context).primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 50,
                                        ),
                                        Text(
                                          "Facebook",
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).textTheme.headline1!.color),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 65,
                                width: 150,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4, left: 10),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Colors.cyan[100],
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.whatsapp,
                                            color: Colors.cyan,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text(
                                            "Whatsapp",
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                letterSpacing: 0.1,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).textTheme.headline1!.color),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  letterSpacing: 0.1, fontSize: 13, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline1!.color),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                              },
                              child: Text(
                                "Sign up now!",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 130),
            child: Container(
              height: 170,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "phone number",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline1!.color),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: CountryPickerDropdown(
                                initialValue: 'IN',
                                onValuePicked: (Country country) {
                                  setState(() {
                                    countryCode = country.phoneCode;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 16),
                                  border: InputBorder.none,
                                  hintText: "Enter phone number",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270, left: 40, right: 40),
            child: InkWell(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyScreen()));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).backgroundColor,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
