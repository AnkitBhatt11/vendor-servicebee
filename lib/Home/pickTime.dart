import 'package:flutter/material.dart';
import 'package:wellcare/Home/selectHospital.dart';

class PickTimeScreen extends StatefulWidget {
  final HospitalList? hospitalDetails;

  const PickTimeScreen({Key? key, this.hospitalDetails}) : super(key: key);
  @override
  _PickTimeScreenState createState() => _PickTimeScreenState();
}

class _PickTimeScreenState extends State<PickTimeScreen> {
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
                  "Pick A Time",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(widget.hospitalDetails!.img),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.hospitalDetails!.txt1,
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
                                              .color),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.hospitalDetails!.txt2,
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
                                              .color),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[800],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      widget.hospitalDetails!.txt3,
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
                                                  .color),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.cyan[100]),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 18,
                                            color: Colors.cyan,
                                          ),
                                          Center(
                                            child: Text(
                                              "2 km",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      letterSpacing: 0.1,
                                                      fontSize: 12,
                                                      color: Colors.cyan,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.2),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      sampleTime(
                        "Sample Time",
                      ),
                      sampleTime("Check- Up Time"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                height: 90,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          "Next",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).canvasColor),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget sampleTime(
    String txt1,
  ) {
    return Container(
      height: 270,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "September 2020",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.1,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headline1!.color),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Mon",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                      Text(
                        "09/09",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            "Tue",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color),
                          ),
                          Text(
                            "10/09",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Wed",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                      Text(
                        "11/09",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Thu",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                      Text(
                        "12/09",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Fri",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                      Text(
                        "13/09",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Time",
                style: Theme.of(context).textTheme.caption!.copyWith(
                    letterSpacing: 0.1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1!.color),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        "06:00 Am",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        "06:30 Am",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.cyanAccent),
                    child: Center(
                      child: Text(
                        "07:00 Am",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).canvasColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        "07:30 Am",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color),
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
  }
}
