import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart';

class NewsDetailScreen extends StatefulWidget {
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  List<String> imageList = [
    ConstanceData.doctorGroup,
    ConstanceData.covid1,
    ConstanceData.covid2,
    ConstanceData.covid3,
    ConstanceData.covid4,
    ConstanceData.doctor5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              title: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "News",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.1,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: innerBoxIsScrolled == true
                            ? Theme.of(context).textTheme.headline1!.color
                            : Theme.of(context).backgroundColor,
                      ),
                ),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, top: 15),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).backgroundColor,
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
              ),
              automaticallyImplyLeading: false,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        ConstanceData.doctorGroup,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.3)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 200),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 0,
                        color: Theme.of(context).backgroundColor,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doctor Visits and Getting\nMedicines",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 16,
                                          height: 1.6,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                                        "2020/09/07",
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
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      width: 300,
                                      child: Text(
                                        "Surge testing is the rollout of additional community testing of people who do not have any coronavirus symptoms.It aims to help scientists and public health officials learn more about mutated Covid-19 variants.It will also help reduce the spread of infection by finding asymptomatic cases and prompting people to self-isolate.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 12,
                                              height: 1.4,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .color,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 14, top: 15),
                  child: Container(
                    height: 35,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        showShareAlertDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Icon(
                          Icons.share,
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Trending",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      imageList[index],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "COVID-19 affects each...",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "The most common symptoms...",
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
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_outlined,
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "2020/09/08",
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
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 20,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.cyan[100],
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "News",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  letterSpacing: 0.1,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.cyan[300],
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showShareAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(top: 150),
            child: AlertDialog(
              content: Container(
                height: 270,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Share',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        customStack(
                          "Facebook",
                          ConstanceData.fbIcon,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        customStack(
                          "Twitter",
                          ConstanceData.twitter,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        customStack(
                          "Instagram",
                          ConstanceData.insta,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        customStack(
                          "Whatsapp",
                          ConstanceData.whIcon,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        customStack(
                          "Messager",
                          ConstanceData.messanger,
                        ),
                        Expanded(child: Container())
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Confirm",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).canvasColor,
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
            ),
          );
        });
      },
    );
  }

  Widget customStack(String text, String image) {
    return Expanded(
      child: Container(
        child: Stack(
          children: [
            Card(
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
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 30,
                width: 30,
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
