// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wellcare/widget/textwidget.dart';
import 'package:wellcare/widget/widgetdropDown.dart';
import 'package:wellcare/constance/constance.dart';

class HealthProfile extends StatefulWidget {
  @override
  _HealthProfileState createState() => _HealthProfileState();
}

class _HealthProfileState extends State<HealthProfile> {
  String installationDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
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
                      padding: const EdgeInsets.only(left: 14, right: 14, top: 35),
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
                              "Create A Health All_Screens",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    letterSpacing: 0.1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).canvasColor,
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
              Expanded(flex: 1, child: Container()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 130),
            child: Container(
              height: 400,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          CustomeTextField(
                            txt1: "First name & LastName",
                            txt2: "jessica Jung",
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CustomeDropDown(
                                  list: ["Male", "Female", "Friends"],
                                  txt1: "Relative",
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomeDropDown(
                                  list: ["Male", "Female"],
                                  txt1: "Gender",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Date Of Birth",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline1!.color),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(color: (Theme.of(context).textTheme.headline1!.color)!),
                              ),
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
                                    color: Theme.of(context).textTheme.headline1!.color,
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
                          Row(
                            children: [
                              Expanded(
                                child: CustomeTextField(
                                  textInputType: TextInputType.number,
                                  txt1: "Height(cm)",
                                  txt2: "height",
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomeTextField(
                                  textInputType: TextInputType.number,
                                  txt1: "Weight (Kg)",
                                  txt2: "weight",
                                ),
                              ),
                            ],
                          ),
                          CustomeDropDown(
                            txt1: "Blood group",
                            list: [
                              "o",
                              "o+",
                              "AB",
                              "AB+",
                              "AB-",
                              "o-",
                              "B+",
                              "B-",
                              "A+",
                              "A-",
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 510, left: 40, right: 40),
            child: InkWell(
              onTap: () {
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
                    "Create a profile",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).canvasColor,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundImage: AssetImage(ConstanceData.p5),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 3,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Theme.of(context).backgroundColor,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
}
