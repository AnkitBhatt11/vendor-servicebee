import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wellcare/constance/constance.dart';

class QuestionForDoctor extends StatefulWidget {
  @override
  _QuestionForDoctorState createState() => _QuestionForDoctorState();
}

class _QuestionForDoctorState extends State<QuestionForDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 50),
            child: Row(
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
                  "Doctor Information",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.1,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.indigo[100],
                    ),
                    child: Icon(
                      Icons.error_outline,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 14, right: 14),
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    elevation: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ConstanceData.p5,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jessica Jung",
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
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Female",
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
                                                      .color),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.calendarWeek,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "21/09/1999",
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
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black26,
                            size: 22,
                          ),
                          border: InputBorder.none,
                          hintText: "Type something",
                          hintStyle:
                              Theme.of(context).textTheme.caption!.copyWith(
                                    letterSpacing: 0.1,
                                    fontSize: 15,
                                    color: Colors.black38,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.send,
                      color: Colors.black26,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
