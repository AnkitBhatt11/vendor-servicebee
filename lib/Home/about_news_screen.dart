// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:wellcare/Home/all_screen.dart';

class AboutNewsScreen extends StatefulWidget {
  @override
  _AboutNewsScreenState createState() => _AboutNewsScreenState();
}

class _AboutNewsScreenState extends State<AboutNewsScreen> {
  bool isAll = true;
  bool isHealth = false;
  bool isNews = false;
  bool isCancer = false;
  bool isMedical = false;
  bool isLive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).appBarTheme.color,
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 10,
              ),
              Row(
                children: [
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Container(
                  //     height: 35,
                  //     width: 35,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: Colors.indigo[100],
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 8),
                  //       child: Icon(
                  //         Icons.arrow_back_ios,
                  //         color: Theme.of(context).primaryColor,
                  //         size: 20,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(child: SizedBox()),
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffFAFAFA),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enter',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Pincode',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffFAFAFA),
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 14, right: 14, top: 5),
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Container(
              //   height: 22,
              //   width: MediaQuery.of(context).size.width,
              //   child: ListView(
              //     shrinkWrap: true,
              //     padding: EdgeInsets.zero,
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       // Row(
              //       //   children: [
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = true;
              //       //           isHealth = false;
              //       //           isNews = false;
              //       //           isCancer = false;
              //       //           isMedical = false;
              //       //           isLive = false;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         crossAxisAlignment: CrossAxisAlignment.center,
              //       //         mainAxisAlignment: MainAxisAlignment.center,
              //       //         children: [
              //       //           Text(
              //       //             "All",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isAll == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           Expanded(child: SizedBox()),
              //       //           isAll == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //     SizedBox(
              //       //       width: 25,
              //       //     ),
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = false;
              //       //           isHealth = true;
              //       //           isNews = false;
              //       //           isCancer = false;
              //       //           isMedical = false;
              //       //           isLive = false;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         children: [
              //       //           Text(
              //       //             "Health",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isHealth == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           isHealth == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //     SizedBox(
              //       //       width: 25,
              //       //     ),
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = false;
              //       //           isHealth = false;
              //       //           isNews = true;
              //       //           isCancer = false;
              //       //           isMedical = false;
              //       //           isLive = false;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         children: [
              //       //           Text(
              //       //             "News",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isNews == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           isNews == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //     SizedBox(
              //       //       width: 25,
              //       //     ),
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = false;
              //       //           isHealth = false;
              //       //           isNews = false;
              //       //           isCancer = true;
              //       //           isMedical = false;
              //       //           isLive = false;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         children: [
              //       //           Text(
              //       //             "Cancer",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isCancer == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           isCancer == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //     SizedBox(
              //       //       width: 25,
              //       //     ),
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = false;
              //       //           isHealth = false;
              //       //           isNews = false;
              //       //           isCancer = false;
              //       //           isMedical = true;
              //       //           isLive = false;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         children: [
              //       //           Text(
              //       //             "Medical",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isMedical == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           isMedical == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //     SizedBox(
              //       //       width: 25,
              //       //     ),
              //       //     InkWell(
              //       //       onTap: () {
              //       //         setState(() {
              //       //           isAll = false;
              //       //           isHealth = false;
              //       //           isNews = false;
              //       //           isCancer = false;
              //       //           isMedical = false;
              //       //           isLive = true;
              //       //         });
              //       //       },
              //       //       child: Column(
              //       //         children: [
              //       //           Text(
              //       //             "Live",
              //       //             style: Theme.of(context)
              //       //                 .textTheme
              //       //                 .caption!
              //       //                 .copyWith(
              //       //                   letterSpacing: 0.1,
              //       //                   fontSize: 14,
              //       //                   fontWeight: FontWeight.bold,
              //       //                   color: isLive == true
              //       //                       ? Theme.of(context).primaryColor
              //       //                       : Theme.of(context)
              //       //                           .textTheme
              //       //                           .headline1!
              //       //                           .color,
              //       //                 ),
              //       //           ),
              //       //           isLive == true
              //       //               ? CircleAvatar(
              //       //                   radius: 2,
              //       //                   backgroundColor:
              //       //                       Theme.of(context).primaryColor,
              //       //                 )
              //       //               : SizedBox(),
              //       //         ],
              //       //       ),
              //       //     ),
              //       //   ],
              //       // ),
              //     ],
              //   ),
              // ),
              // AllScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
