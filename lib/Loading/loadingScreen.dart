import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/main.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              controller: _pageController,
              onPageChanged: (pageNo) {
                setState(() {
                  pageIndex = pageNo;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          pageIndex == 0
                              ? ConstanceData.introduction1
                              : pageIndex == 1
                                  ? ConstanceData.introduction2
                                  : ConstanceData.introduction3,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        pageIndex == 0
                            ? "Quality Reputation?"
                            : pageIndex == 1
                                ? "Online Health check"
                                : "Research, deep testing",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1!.color),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        pageIndex == 0
                            ? "The tearm of reputable doctor has many years of professional experience."
                            : pageIndex == 1
                                ? "Easy and Convenient online check-ups right from your home"
                                : "Ensure the most accurate results for the health of your family.",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.2,
                              fontSize: 16,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.5),
                              height: 1.5,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          pageIndex == 2
              ? InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.Sign);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Get Start!",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.2,
                                fontSize: 18,
                                color: Theme.of(context).backgroundColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: pageIndex == 0
                          ? Theme.of(context).primaryColor
                          : Colors.black12,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: pageIndex == 1
                          ? Theme.of(context).primaryColor
                          : Colors.black12,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: pageIndex == 2
                          ? Theme.of(context).primaryColor
                          : Colors.black12,
                    ),
                  ],
                ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
