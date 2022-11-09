import 'package:flutter/material.dart';
import 'package:wellcare/constance/constance.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                  "Search",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Expanded(child: SizedBox()),
                SizedBox(
                  width: 35,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 14, top: 10),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                                  letterSpacing: 0.1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          customStack(
                            "Orthopodist",
                            ConstanceData.search1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          customStack(
                            "Surgeon",
                            ConstanceData.search2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          customStack(
                            "Dentist",
                            ConstanceData.search3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          customStack(
                            "Orthopodist",
                            ConstanceData.search4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          customStack(
                            "Orthopodist",
                            ConstanceData.search5,
                          ),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customStack(String text, String image) {
    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            height: 1.4,
                          ),
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
    );
  }
}
