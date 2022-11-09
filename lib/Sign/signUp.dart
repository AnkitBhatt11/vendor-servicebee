// ignore_for_file: unnecessary_null_comparison
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellcare/main.dart';
import 'package:wellcare/widget/textwidget.dart';
import 'package:intl/intl.dart';
import 'package:wellcare/widget/widgetdropDown.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String installationDate = "";
  late File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
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
                                  Navigator.pop(context);
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
                                  "Sign up",
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                        letterSpacing: 0.1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70, left: 14, right: 14),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomeTextField(
                                txt1: "Frist name & last name",
                                txt2: "Enter Your Name",
                              ),
                              CustomeDropDown(
                                txt1: "Gender",
                                list: [
                                  "Male",
                                  "Female",
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Date Of Birth",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                    letterSpacing: 0.1,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).textTheme.headline1!.color),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _buildBottomPicker(
                                        CupertinoDatePicker(
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.date,
                                          initialDateTime: DateTime.now().subtract(Duration(days: 365 * 30)),
                                          maximumYear: DateTime.now().year,
                                          maximumDate: DateTime.now(),
                                          onDateTimeChanged: (DateTime newDateTime) {
                                            setState(() {
                                              installationDate = DateFormat('yyyy/MM/dd').format(newDateTime);
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.black38)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        installationDate != null ? installationDate : "Select Date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Icon(
                                        Icons.calendar_today,
                                        size: 20,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomeTextField(
                                txt1: "Phone Number",
                                txt2: "Enter number",
                                textInputType: TextInputType.number,
                              ),
                              CustomeTextField(
                                txt1: " Email",
                                txt2: "Enter Email",
                                textInputType: TextInputType.emailAddress,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, Routes.Home);
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
                                      "SignUp",
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
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                        child: _image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : SizedBox(),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 220, left: 60),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor: Theme.of(context).backgroundColor,
                          child: InkWell(
                            onTap: () {
                              setImage(_image);
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 240,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  setImage(File _image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: Theme.of(context).popupMenuTheme.color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: Text(
                                "Set Product image",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // getImage(true);
                            },
                            child: Text(
                              'Photo Gallery',
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              // getImage(false);
                            },
                            child: Text(
                              'Camera',
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyText2!.color,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  var isDispose = false;
  bool isProgress = false;

  // Future getImage(
  //   bool isgallery,
  // ) async {
  //   File image;
  //   if (isgallery) {
  //     final ImagePicker _picker = ImagePicker();
  //     final XFile? images = await _picker.pickImage(source: ImageSource.gallery);

  //     // ignore: deprecated_member_use
  //     image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
  //   } else {
  //     // ignore: deprecated_member_use
  //     image = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 50);
  //   }
  //   if (image != null) {
  //     if (!isDispose) {
  //       setState(() {
  //         _image = image;

  //         isProgress = true;
  //       });

  //       setState(() {
  //         isProgress = false;
  //       });
  //     }
  //   }
  // }
}
