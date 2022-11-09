import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Networking/AccessNetwork.dart';
import '../constance/constance.dart';

class update_profile extends StatefulWidget {
  const update_profile({Key? key}) : super(key: key);

  @override
  State<update_profile> createState() => _update_profileState();
}

class _update_profileState extends State<update_profile> {
  String name = '', phone_number = '', email = '', address = '';
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _addressController = TextEditingController();

  AlertDialog? alert;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
  }

  void fetchProfile() async {
    showLoaderDialog(context);
    access_network().show_user_profile().then((_) {
      if (mounted) {
        setState(() {
          ConstanceData.setProfile(_);
          Navigator.pop(context);
        });
      } else {}
    });
  }

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
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Profile Details",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  // height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 5,
                        title: Text(
                          ConstanceData.prof?.name ?? "",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 5,
                        title: Text(
                          ConstanceData.prof?.phone ?? "NA",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 5,
                        title: Text(
                          ConstanceData.prof?.email ?? "NA",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                      ListTile(
                        horizontalTitleGap: 5,
                        title: Text(
                          ConstanceData.prof?.address ?? "NA",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Update Profile",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.5,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        // color: Colors.grey.shade100,
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: TextField(
                            controller: _nameController,
                            maxLines: 1,
                            onChanged: (String txt) {
                              // phoneNumber = txt;
                            },
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: new InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom: 12, // HERE THE IMPORTANT PART
                                ),
                                errorText: null,
                                border: InputBorder.none,
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.black),
                                alignLabelWithHint: true),
                            keyboardType: TextInputType.text,
                            inputFormatters: <TextInputFormatter>[],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.5,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: _addressController,
                          maxLines: 1,
                          onChanged: (String txt) {
                            // phoneNumber = txt;
                          },
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(
                              bottom: 12, // HERE THE IMPORTANT PART
                            ),
                            errorText: null,
                            border: InputBorder.none,
                            hintText: "Address",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.text,
                          inputFormatters: <TextInputFormatter>[],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.5,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        // color: Colors.grey.shade200,
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: _emailController,
                          maxLines: 1,
                          onChanged: (String txt) {
                            // phoneNumber = txt;
                          },
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(
                              bottom: 12, // HERE THE IMPORTANT PART
                            ),
                            errorText: null,
                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: <TextInputFormatter>[],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (_nameController.text.isNotEmpty &&
                                  _addressController.text.isNotEmpty &&
                                  _emailController.text.isNotEmpty) {
                                if (isValidEmail(_emailController.text)) {
                                  setState(() {
                                    name = _nameController.text;
                                    address = _addressController.text;
                                    email = _emailController.text;
                                    saveInfo();
                                    _nameController.clear();
                                    _addressController.clear();
                                    _emailController.clear();
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Enter a valid email",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Enter all the details",
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
                                'Update',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ExpansionTile(
                      //   title: Text(
                      //     'Update Pincode',
                      //     style: Theme.of(context).textTheme.caption!.copyWith(
                      //         letterSpacing: 0.1,
                      //         fontSize: 16,
                      //         // fontWeight: FontWeight.bold,
                      //         color:
                      //             Theme.of(context).textTheme.bodyText1!.color),
                      //   ),
                      //   children: [
                      //     Container(
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(
                      //           color: Colors.grey.shade400,
                      //           width: 0.5,
                      //         ),
                      //       ),
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       // color: Colors.grey.shade200,
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: TextField(
                      //         controller: _pincodeController,
                      //         maxLines: 1,
                      //         onChanged: (String txt) {
                      //           // phoneNumber = txt;
                      //         },
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //         cursorColor: Theme.of(context).primaryColor,
                      //         decoration: new InputDecoration(
                      //           contentPadding: EdgeInsets.only(
                      //             bottom: 12, // HERE THE IMPORTANT PART
                      //           ),
                      //           errorText: null,
                      //           counterText: "",
                      //           border: InputBorder.none,
                      //           hintText: "Pincode",
                      //           hintStyle: TextStyle(color: Colors.black),
                      //         ),
                      //         keyboardType: TextInputType.number,
                      //         maxLength: 6,
                      //         inputFormatters: <TextInputFormatter>[],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       height: 38,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(5.0)),
                      //       ),
                      //       child: Material(
                      //         color: Colors.transparent,
                      //         child: InkWell(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(24.0)),
                      //           highlightColor: Colors.transparent,
                      //           onTap: () {
                      //             if (_pincodeController.text.isNotEmpty &&
                      //                 _pincodeController.text.length == 6) {
                      //               setState(() {
                      //                 pincode =
                      //                     _pincodeController.text.toString();
                      //                 saveInfo();
                      //                 _pincodeController.clear();
                      //               });
                      //             } else {
                      //               Fluttertoast.showToast(
                      //                   msg: "Enter a valid pincode",
                      //                   toastLength: Toast.LENGTH_SHORT,
                      //                   gravity: ToastGravity.CENTER,
                      //                   timeInSecForIosWeb: 1,
                      //                   backgroundColor: Colors.black,
                      //                   textColor: Colors.white,
                      //                   fontSize: 16.0);
                      //             }
                      //           },
                      //           child: Center(
                      //             child: Text(
                      //               'Update',
                      //               style: GoogleFonts.roboto(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Divider(
                      //   thickness: 0.5,
                      // ),
                      // ExpansionTile(
                      //   title: Text(
                      //     'Update City',
                      //     style: Theme.of(context).textTheme.caption!.copyWith(
                      //         letterSpacing: 0.1,
                      //         fontSize: 16,
                      //         // fontWeight: FontWeight.bold,
                      //         color:
                      //             Theme.of(context).textTheme.bodyText1!.color),
                      //   ),
                      //   children: [
                      //     Container(
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(
                      //           color: Colors.grey.shade400,
                      //           width: 0.5,
                      //         ),
                      //       ),
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: TextField(
                      //         controller: _cityController,
                      //         maxLines: 1,
                      //         onChanged: (String txt) {
                      //           // phoneNumber = txt;
                      //         },
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //         cursorColor: Theme.of(context).primaryColor,
                      //         decoration: new InputDecoration(
                      //           contentPadding: EdgeInsets.only(
                      //             bottom: 12, // HERE THE IMPORTANT PART
                      //           ),
                      //           errorText: null,
                      //           border: InputBorder.none,
                      //           hintText: "City",
                      //           hintStyle: TextStyle(color: Colors.black),
                      //         ),
                      //         keyboardType: TextInputType.text,
                      //         inputFormatters: <TextInputFormatter>[],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       height: 38,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(5.0)),
                      //       ),
                      //       child: Material(
                      //         color: Colors.transparent,
                      //         child: InkWell(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(24.0)),
                      //           highlightColor: Colors.transparent,
                      //           onTap: () {
                      //             if (_cityController.text.isNotEmpty) {
                      //               setState(() {
                      //                 city = _cityController.text;
                      //                 saveInfo();
                      //                 _cityController.clear();
                      //               });
                      //             } else {
                      //               Fluttertoast.showToast(
                      //                   msg: "Enter a valid city",
                      //                   toastLength: Toast.LENGTH_SHORT,
                      //                   gravity: ToastGravity.CENTER,
                      //                   timeInSecForIosWeb: 1,
                      //                   backgroundColor: Colors.black,
                      //                   textColor: Colors.white,
                      //                   fontSize: 16.0);
                      //             }
                      //           },
                      //           child: Center(
                      //             child: Text(
                      //               'Update',
                      //               style: GoogleFonts.roboto(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Divider(
                      //   thickness: 0.5,
                      // ),
                      // ExpansionTile(
                      //   title: Text(
                      //     'Update Address',
                      //     style: Theme.of(context).textTheme.caption!.copyWith(
                      //         letterSpacing: 0.1,
                      //         fontSize: 16,
                      //         // fontWeight: FontWeight.bold,
                      //         color:
                      //             Theme.of(context).textTheme.bodyText1!.color),
                      //   ),
                      //   children: [
                      //     Container(
                      //       height: 40,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(
                      //           color: Colors.grey.shade400,
                      //           width: 0.5,
                      //         ),
                      //       ),
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: TextField(
                      //         controller: _addressController,
                      //         maxLines: 1,
                      //         onChanged: (String txt) {
                      //           // phoneNumber = txt;
                      //         },
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //         ),
                      //         cursorColor: Theme.of(context).primaryColor,
                      //         decoration: new InputDecoration(
                      //           contentPadding: EdgeInsets.only(
                      //             bottom: 12, // HERE THE IMPORTANT PART
                      //           ),
                      //           errorText: null,
                      //           border: InputBorder.none,
                      //           hintText: "Address",
                      //           hintStyle: TextStyle(color: Colors.black),
                      //         ),
                      //         keyboardType: TextInputType.text,
                      //         inputFormatters: <TextInputFormatter>[],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 5,
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.only(
                      //         left: 20,
                      //         right: 20,
                      //       ),
                      //       height: 38,
                      //       decoration: BoxDecoration(
                      //         color: Colors.black,
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(5.0)),
                      //       ),
                      //       child: Material(
                      //         color: Colors.transparent,
                      //         child: InkWell(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(24.0)),
                      //           highlightColor: Colors.transparent,
                      //           onTap: () {
                      //             if (_addressController.text.isNotEmpty) {
                      //               setState(() {
                      //                 address = _addressController.text;
                      //                 saveInfo();
                      //                 _addressController.clear();
                      //               });
                      //             } else {
                      //               Fluttertoast.showToast(
                      //                   msg: "Enter a valid city",
                      //                   toastLength: Toast.LENGTH_SHORT,
                      //                   gravity: ToastGravity.CENTER,
                      //                   timeInSecForIosWeb: 1,
                      //                   backgroundColor: Colors.black,
                      //                   textColor: Colors.white,
                      //                   fontSize: 16.0);
                      //             }
                      //           },
                      //           child: Center(
                      //             child: Text(
                      //               'Update',
                      //               style: GoogleFonts.roboto(
                      //                 color: Colors.white,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Divider(
                      //   thickness: 0.5,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(txt) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }

  @override
  void initState() {
    super.initState();
    name = ConstanceData.prof?.name ?? "";
    email = ConstanceData.prof?.email ?? "";
    address = ConstanceData.prof?.address ?? "";
    Future.delayed(Duration.zero, () {
      fetchProfile();
    });
  }

  saveInfo() async {
    access_network().update_user_profile(name, email, address).then((_) {
      access_network().show_user_profile().then((_) {
        setState(() {
          ConstanceData.setProfile(_);
          name = ConstanceData.prof?.name ?? "NA";
          email = ConstanceData.prof?.email ?? "NA";
          address = ConstanceData.prof?.address ?? "NA";
        });
      });
    });
  }
}
