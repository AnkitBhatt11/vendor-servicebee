// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellcare/Profile/UpdateProfile.dart';

import 'package:wellcare/constance/constance.dart';

import '../Model/Setting.dart';
import '../OtherScreens/AboutUs.dart';
import '../OtherScreens/HelpSupport.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  final void Function(bool) callback;

  const ProfileScreen({Key? key, required this.callback}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<setting> list = [
    setting(
      'Account Settings',
      'Change account settings',
      Icons.people,
      () {},
    ),
    setting(
      'App Feedback',
      'Help us improve your experience',
      Icons.star,
      () {},
    ),
    setting(
      'Share this app',
      'Invite your friends',
      Icons.share,
      () {},
    ),
    setting(
      'Register as Partner',
      'Join us',
      Icons.app_registration,
      () {},
    ),
    setting(
      'Help & Support',
      'Get help with your account',
      Icons.help,
      () {},
    ),
    setting(
      'Follow us',
      'Follow us on social media',
      Icons.facebook,
      () {},
    ),
    setting(
      'T&C',
      'Terms and Conditions',
      FontAwesomeIcons.fileContract,
      () {},
    ),
    setting(
      'About Service Bee',
      'About, Terms of Use, Privacy Policy',
      Icons.info,
      () {},
    ),
    setting(
      'Logout',
      'Logout from your account',
      Icons.exit_to_app,
      () {},
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(
                left: 15,
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Account",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1!.color),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (list[index].name == 'Account Settings') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => update_profile(),
                            ),
                          );
                        } else if (list[index].name == 'Logout') {
                          setIt();
                        } else if (list[index].name == 'Help & Support') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpSupport(),
                            ),
                          );
                        } else if (list[index].name == 'About Service Bee') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => about_us(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Not uploaded to PlayStore yet",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    list[index].image,
                                    color: Colors.grey.shade700,
                                    size: 27,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index].name,
                                          style: const TextStyle(
                                              fontSize: 14.5,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          list[index].desc,
                                          style: TextStyle(
                                              fontSize: 12.5,
                                              color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // child: Card(
                      //   child: Container(
                      //     height: 70,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: Row(
                      //       children: [
                      //         Expanded(
                      //           flex: 1,
                      //           child: Icon(
                      //             list[index].image,
                      //             color: Colors.grey.shade400,
                      //             size: 30,
                      //           ),
                      //         ),
                      //         Expanded(
                      //           flex: 5,
                      //           child: Container(
                      //             padding: EdgeInsets.only(top: 10, bottom: 10),
                      //             child: Column(
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceAround,
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   list[index].name,
                      //                   style: TextStyle(
                      //                     color: Colors.black,
                      //                     fontSize: 18,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   list[index].desc,
                      //                   style: TextStyle(
                      //                     color: Colors.grey.shade800,
                      //                     fontSize: 15,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setIt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged_in', false);
    prefs.clear();
    ConstanceData.last_query == null;
    ConstanceData.prof == null;
    Navigator.pushReplacementNamed(context, Routes.Sign);
  }
}

class ChatList {
  String img;
  String txt1;
  String txt2;
  String txt3;

  ChatList(this.img, this.txt1, this.txt2, this.txt3);
}
