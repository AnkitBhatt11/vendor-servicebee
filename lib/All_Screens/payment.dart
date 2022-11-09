import 'package:flutter/material.dart';
import 'package:wellcare/All_Screens/paymentScreen.dart';

import 'package:wellcare/constance/constance.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                    padding: const EdgeInsets.only(left: 8),
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
                                "Payment Method",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        letterSpacing: 0.1,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ConstanceData.paymentMethod,
                                height: 200,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 320),
            child: Container(
              height: 130,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                        "You don't have any payment method. add now",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color,
                            height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 420, left: 40, right: 40),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()));
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
                    "Add New",
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
    );
  }
}
