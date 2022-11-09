import 'package:flutter/material.dart';
import 'package:wellcare/widget/textwidget.dart';
import 'package:wellcare/widget/widgetdropDown.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.indigo[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "Address Updates",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Theme.of(context).backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6, left: 15, right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                CustomeTextField(
                                  txt1: "Specific address",
                                  txt2: "enter address", 
                                ),
                                CustomeDropDown(
                                  txt1: "The Provincial",
                                  list: ["London", "Manchester", "Edinburgh", "Burmingham", "Bristrol", "Liverpool", "Glasgow"],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomeDropDown(
                                  txt1: "District",
                                  list: ["London", "Manchester", "Edinburgh", "Burmingham", "Bristrol", "Liverpool", "Glasgow"],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomeDropDown(
                                  txt1: "Ward",
                                  list: ["London", "Manchester", "Edinburgh", "Burmingham", "Bristrol", "Liverpool", "Glasgow"],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          checkBoxValue = !checkBoxValue;
                                        });
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(5)),
                                        child: checkBoxValue == true
                                            ? Icon(
                                                Icons.check,
                                                color: Theme.of(context).backgroundColor,
                                                size: 17,
                                              )
                                            : SizedBox(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Select the address as defalut',
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            letterSpacing: 0.1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.4),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 470, left: 25, right: 25),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Address Updates",
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
