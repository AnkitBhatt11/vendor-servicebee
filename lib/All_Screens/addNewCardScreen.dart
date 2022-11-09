import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/widget/textwidget.dart';

class AddNewCardScreen extends StatefulWidget {
  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
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
                                "Add New Card",
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ConstanceData.card,
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 290),
            child: Container(
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomeTextField(
                            txt1: "Card Number",
                            txt2: "enter card number",
                            textInputType: TextInputType.number,
                          ),
                          CustomeTextField(
                            txt1: "Card Holder Name",
                            txt2: "enter name",
                            textInputType: TextInputType.name,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomeTextField(
                                  txt1: "Expiry",
                                  txt2: "enter date",
                                  textInputType: TextInputType.number,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomeTextField(
                                  txt1: "Security Code",
                                  txt2: "Enter code",
                                  textInputType: TextInputType.name,
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
          Padding(
            padding: const EdgeInsets.only(top: 580, left: 40, right: 40),
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
                    "Save",
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
