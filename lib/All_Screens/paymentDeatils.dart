import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellcare/constance/constance.dart';

class PaymentsDetails extends StatefulWidget {
  @override
  _PaymentsDetailsState createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 35),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 90),
                child: Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    ConstanceData.waitforpay,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Wait For pay",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    ConstanceData.endocrine,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Endocrine",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.cyan[100],
                                    ),
                                    child: Icon(
                                      Icons.check_box_outlined,
                                      color: Colors.cyan,
                                      size: 27,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Dentist",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment is in progress",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.1,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      height: 1.2),
                ),
                Container(
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 14, right: 14, top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Code",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.calendar,
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "1 schedule",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .color,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Text(
                                "#0012345678",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Total:",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                              ),
                              Text(
                                "\$ 1200",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.yellow[100]),
                                child: Center(
                                  child: Text(
                                    "Wait for pay",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow[700],
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
