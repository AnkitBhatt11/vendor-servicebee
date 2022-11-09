import 'package:flutter/material.dart';
import 'package:wellcare/All_Screens/paymentDeatils.dart';

import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/widget/textwidget.dart';
import 'package:wellcare/widget/txtwidgetwithicon.dart';

import 'addNewCardScreen.dart';
// import 'package:fw_ticket/fw_ticket.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Container(
                      height: 170,
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
                                "Payment",
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
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20, right: 20, top: 90),
              //   child: Column(
              //     children: <Widget>[
              //       Ticket(
              //         innerRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(10.0),
              //           bottomRight: Radius.circular(10.0),
              //         ),
              //         outerRadius: BorderRadius.all(
              //           Radius.circular(10.0),
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 0,
              //             spreadRadius: 0,
              //             color: Colors.grey[400],
              //           )
              //         ],
              //         child: Container(
              //           color: Theme.of(context).appBarTheme.color,
              //           child: Column(
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
              //                 child: Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     SizedBox(
              //                       height: 20,
              //                     ),
              //                     Container(
              //                       height: 70,
              //                       width: 70,
              //                       decoration: BoxDecoration(
              //                         image: DecorationImage(image: AssetImage(ConstanceData.p5), fit: BoxFit.cover),
              //                         borderRadius: BorderRadius.circular(15),
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(top: 10, left: 10),
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(
              //                             "Jessica Jung.",
              //                             style: Theme.of(context).textTheme.caption.copyWith(
              //                                 letterSpacing: 0.1,
              //                                 fontSize: 17,
              //                                 fontWeight: FontWeight.bold,
              //                                 color: Theme.of(context).textTheme.bodyText1.color,
              //                                 height: 1.2),
              //                             textAlign: TextAlign.center,
              //                           ),
              //                           SizedBox(
              //                             height: 10,
              //                           ),
              //                           Row(
              //                             children: [
              //                               Icon(
              //                                 Icons.person_outline_outlined,
              //                                 color: Theme.of(context).primaryColor,
              //                               ),
              //                               Text(
              //                                 "Male",
              //                                 style: Theme.of(context).textTheme.caption.copyWith(
              //                                     letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.bodyText1.color, height: 1.2),
              //                                 textAlign: TextAlign.center,
              //                               ),
              //                             ],
              //                           ),
              //                           Row(
              //                             children: [
              //                               Icon(
              //                                 Icons.calendar_today_outlined,
              //                                 color: Colors.red,
              //                                 size: 17,
              //                               ),
              //                               Text(
              //                                 "21/09/1999",
              //                                 style: Theme.of(context).textTheme.caption.copyWith(
              //                                     letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.bodyText1.color, height: 1.2),
              //                                 textAlign: TextAlign.center,
              //                               ),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(child: SizedBox()),
              //                     Padding(
              //                       padding: const EdgeInsets.only(top: 17, right: 6),
              //                       child: Container(
              //                         height: 35,
              //                         width: 35,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8),
              //                           color: Colors.red[100],
              //                         ),
              //                         child: Icon(
              //                           Icons.edit,
              //                           color: Colors.red,
              //                           size: 20,
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 15,
              //               ),
              //               DottedLine(
              //                 dashLength: 10,
              //                 dashGapLength: 10,
              //                 lineThickness: 1,
              //                 dashColor: Theme.of(context).primaryColor,
              //                 direction: Axis.horizontal,
              //                 lineLength: MediaQuery.of(context).size.width,
              //                 dashRadius: 30,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Ticket(
              //         innerRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
              //         outerRadius: BorderRadius.all(Radius.circular(10.0)),
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 0,
              //             spreadRadius: 0,
              //             color: Colors.grey[400],
              //           )
              //         ],
              //         child: Container(
              //           color: Theme.of(context).appBarTheme.color,
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              //             child: Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       "Sample time",
              //                       style: Theme.of(context).textTheme.caption.copyWith(
              //                           letterSpacing: 0.1,
              //                           fontSize: 17,
              //                           fontWeight: FontWeight.bold,
              //                           color: Theme.of(context).textTheme.bodyText1.color,
              //                           height: 1.2),
              //                     ),
              //                     Expanded(child: SizedBox()),
              //                     Text(
              //                       "Check-Up time",
              //                       style: Theme.of(context).textTheme.caption.copyWith(
              //                           letterSpacing: 0.1,
              //                           fontSize: 17,
              //                           fontWeight: FontWeight.bold,
              //                           color: Theme.of(context).textTheme.bodyText1.color,
              //                           height: 1.2),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 7,
              //                 ),
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           FontAwesomeIcons.calendar,
              //                           color: Theme.of(context).primaryColor,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "20/20/09/18",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     Expanded(child: SizedBox()),
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           FontAwesomeIcons.calendar,
              //                           color: Theme.of(context).primaryColor,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "2020/09/18",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       width: 30,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 7,
              //                 ),
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           FontAwesomeIcons.clock,
              //                           color: Colors.red,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "08:00 am",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     Expanded(child: SizedBox()),
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           FontAwesomeIcons.calendar,
              //                           color: Colors.red,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "14:00 pm",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       width: 44,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 7,
              //                 ),
              //                 Row(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           Icons.location_on_outlined,
              //                           color: Colors.cyanAccent,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "John Hopkins \nHospital....",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     Expanded(child: SizedBox()),
              //                     Row(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.start,
              //                       children: [
              //                         Icon(
              //                           Icons.location_on_outlined,
              //                           color: Colors.cyanAccent,
              //                           size: 16,
              //                         ),
              //                         SizedBox(
              //                           width: 5,
              //                         ),
              //                         Text(
              //                           "John Hopkins \nHospital....",
              //                           style: Theme.of(context).textTheme.caption.copyWith(
              //                               letterSpacing: 0.1,
              //                               fontSize: 13,
              //                               fontWeight: FontWeight.bold,
              //                               color: Theme.of(context).textTheme.headline1.color,
              //                               height: 1.2),
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       width: 15,
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 30,
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          ConstanceData.doctor2,
                                          height: 70,
                                          width: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Basic Health examination",
                                              style: Theme.of(context).textTheme.caption!.copyWith(
                                                  letterSpacing: 0.1,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).textTheme.bodyText1!.color),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.money,
                                                  color: Theme.of(context).primaryColor,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "price:",
                                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                                      letterSpacing: 0.1,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context).textTheme.headline1!.color),
                                                ),
                                                SizedBox(
                                                  width: 65,
                                                ),
                                                Text(
                                                  "\$ 1200",
                                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                                      letterSpacing: 0.1,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context).primaryColor),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomeTextField(
                                      txt1: "Discount",
                                      txt2: "add discount",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showAlertDialog(context);
                                      },
                                      child: CustomeTextField2(
                                        read: true,
                                        txt1: "Payment Method",
                                        txt2: "select payment Method",
                                        suficon: Icons.arrow_forward_ios_rounded,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Total:",
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).textTheme.headline1!.color),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text(
                                          "\$ 1200",
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                              letterSpacing: 0.1, fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PaymentsDetails(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: Theme.of(context).primaryColor),
                                        child: Center(
                                          child: Text(
                                            "Payment",
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).canvasColor),
                                          ),
                                        ),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: AlertDialog(
              content: Container(
                height: 330,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Locate',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1, fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_view_day,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Visa / Master card',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.check,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Edinburgh',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline2!.color),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wallet_membership_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Domestic ATM',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline2!.color),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wallet_travel_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'E-Wallet',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline2!.color),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cases,
                          color: Colors.grey,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Cash',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1, fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline2!.color),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Container(
                                height: 50,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Theme.of(context).primaryColor)),
                                child: Center(
                                  child: Text(
                                    'Cancle',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNewCardScreen(),
                                ),
                              );
                            },
                            child: Center(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Text(
                                    'Select',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
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
            ),
          );
        });
      },
    );
  }
}
