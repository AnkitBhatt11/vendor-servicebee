import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  bool isAppointment = false;
  bool isBill = true;
  bool isQuestion = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 10,
            ),
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
                  "Activity History",
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
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isAppointment = true;
                      isBill = false;
                      isQuestion = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Appointment schedule",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: isAppointment == true ? 14 : 12,
                              fontWeight: FontWeight.bold,
                              color: isAppointment == true
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textTheme.headline1!.color,
                            ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      isAppointment == true
                          ? CircleAvatar(
                              radius: 2,
                              backgroundColor: Theme.of(context).primaryColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAppointment = false;
                      isBill = true;
                      isQuestion = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Bills",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: isBill == true ? 14 : 12,
                              fontWeight: FontWeight.bold,
                              color: isBill == true
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textTheme.headline1!.color,
                            ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      isBill == true
                          ? CircleAvatar(
                              radius: 2,
                              backgroundColor: Theme.of(context).primaryColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {
                    setState(() {
                      isAppointment = false;
                      isBill = false;
                      isQuestion = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Question",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: isQuestion == true ? 14 : 12,
                              fontWeight: FontWeight.bold,
                              color: isQuestion == true
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).textTheme.headline1!.color,
                            ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      isQuestion == true
                          ? CircleAvatar(
                              radius: 2,
                              backgroundColor: Theme.of(context).primaryColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            isQuestion == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          customStack(
                            "Questions\nare waiting",
                            ConstanceData.activity1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          customStack(
                            "The question\nwas rejected",
                            ConstanceData.activity2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          customStack(
                            "The question\nis saved",
                            ConstanceData.activity3,
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      )
                    ],
                  )
                : isBill == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "September 2020",
                            style: Theme.of(context).textTheme.caption!.copyWith(
                                  letterSpacing: 0.1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Payment code",
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
                                      Expanded(child: SizedBox()),
                                      Text(
                                        "#0012345678",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "1 schedule",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .color,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
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
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .color,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "\$\t1200",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.orange[50],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Wait for pay",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  letterSpacing: 0.1,
                                                  fontSize: 11,
                                                  color: Colors.orange,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          ConstanceData.schedule,
                                          height: 180,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 220),
                            child: Container(
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Theme.of(context).backgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),

                                      Text(
                                        "You do not have an appointment!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                letterSpacing: 0.6,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .color),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Book a health care service right away for you and your family!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                letterSpacing: 0.1,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .color,
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
                            padding: const EdgeInsets.only(
                                top: 350, left: 30, right: 30),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Make an appointment",
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        letterSpacing: 0.1,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
          ],
        ),
      ),
    );
  }

  Widget customStack(String text, String image) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        text,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1!.color,
                            height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
