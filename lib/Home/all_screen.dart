import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellcare/constance/constance.dart';
import 'package:wellcare/Home/primaryHomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/Category.dart';
import '../Networking/AccessNetwork.dart';
import 'all_screen1.dart';

class AllScreen extends StatefulWidget {
  final void Function(int)? callback;

  AllScreen(this.callback);

  @override
  _AllScreenState createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  int _current = 0;
  int _currentOffer = 0;
  List<category> list = new List.empty();
  _launchURLApp(var url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  // height: 240,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        items: ConstanceData.bannerList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () {
                                  _launchURLApp(Uri.parse(i.link));
                                },
                                child: Container(
                                  // height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://growgraphics.xyz/service-bee/public/' +
                                            i.url,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.width / (3.5),
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio: 2.8,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ConstanceData.bannerList.map((url) {
                          int index = ConstanceData.bannerList.indexOf(url);
                          return Container(
                            width: 5.0,
                            height: 5.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : Colors.grey.shade400,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        items: ConstanceData.textList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    padding:
                                        EdgeInsets.only(left: 10, right: 20),
                                    child: Center(
                                        child: Text(
                                      '${i.txt}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'proxima',
                                          fontSize: 20),
                                    )),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.width / (3),
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio: 2.8,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentOffer = index;
                              });
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ConstanceData.textList.map((url) {
                        int index = ConstanceData.textList.indexOf(url);
                        return Container(
                          width: 5.0,
                          height: 5.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentOffer == index
                                ? Colors.black
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: list.length * 100,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0.0),
                    itemCount: list.length,
                    itemBuilder: (cont, i) {
                      return getWidget(i);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getWidget(int i) {
    var current = list[i];
    return i >= 0 && i < list.length
        ? Column(
            children: [
              GestureDetector(
                onTap: () => {
                  setState(() {
                    ConstanceData.category_id = current.id;
                    print('clicked');
                    ConstanceData.fragNav?.putPosit(key: 'AllScreen1');
                  }),
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(1.0),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              // color: Color(0xffA8F6FF),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://growgraphics.xyz/service-bee/public/${current.image}',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${current.name}",
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${current.description}",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 11),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            height: 80,
            // child: Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 40,
            //         width: 40,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //             image: AssetImage(
            //               imageList[i],
            //             ),
            //             fit: BoxFit.fill,
            //             scale: 5,
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 14,
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "${nameList[i]}",
            //             style: GoogleFonts.roboto(
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          );
  }

  void fetchCategory() {
    access_network().get_category().then((_) {
      if (mounted) {
        setState(() {
          list = _;
          ConstanceData.categoryList = _;
        });
      } else {
        list = _;
        ConstanceData.categoryList = _;
      }
    });
  }
}
