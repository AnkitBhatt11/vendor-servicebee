import 'package:flutter/material.dart';
import 'package:fragment_navigate/navigate-control.dart';
//import 'package:fragment_navigate/navigate-control.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellcare/Home/homeScreen.dart';
import 'package:wellcare/Model/Profile.dart';
import 'package:fragment_navigate/navigate-support.dart';

import 'package:wellcare/Scheduled/myQuery.dart';

import '../Home/all_screen1.dart';
import '../Home/all_screen2.dart';
import '../Home/faq_page.dart';
import '../Model/Banner.dart';
import '../Model/Category.dart';
import '../Model/QueryOffers.dart';
import '../Model/TextBanner.dart';
import '../Model/city.dart';
import '../Model/last_query.dart';
import '../Model/review.dart';
import '../Profile/ProfileScreen.dart';
import '../Scheduled/querryOffers.dart';
import '../Scheduled/verndorsProfile.dart';

var primaryColorString = '#f19511';
var secondaryColorString = '#384547';
var navColorString = 0xff000104;

//var primaryColorString = '#7065E4';
// var secondaryColorString = '#FFFFFF';
class ConstanceData {
  static const BaseImageUrl = 'assets/';
  static const url = 'https://growgraphics.xyz/service-bee/public/api/user/';
  static final waterDemand = BaseImageUrl + "waterdemand.png";
  static final introduction1 = BaseImageUrl + "Introduction1.png";
  static final introduction2 = BaseImageUrl + "Introduction2.png";
  static final introduction3 = BaseImageUrl + "Introduction3.png";
  static final flag = BaseImageUrl + "flag.png";
  static final doctor1 = BaseImageUrl + "doctor1.png";
  static final bloodPressure = BaseImageUrl + "bloodPressure.png";
  static final general = BaseImageUrl + "general.png";
  static final p4 = BaseImageUrl + "p4.jpg";
  static final p5 = BaseImageUrl + "p5.jpg";
  static final p6 = BaseImageUrl + "p6.jpg";
  static final bloodsuger = BaseImageUrl + "bloodsugar.png";
  static final bMI = BaseImageUrl + "BMI.png";
  static final bMR = BaseImageUrl + "BMR.png";

  static final alcohol = BaseImageUrl + "alcohol.png";
  static final doctor2 = BaseImageUrl + "doctor2.png";
  static final chat = BaseImageUrl + "chat.png";
  static final news = BaseImageUrl + "news.png";
  static final doctor3 = BaseImageUrl + "doctor3.png";
  static final doctor4 = BaseImageUrl + "doctor4.png";
  static final doctor5 = BaseImageUrl + "doctor5.png";
  static final doctor6 = BaseImageUrl + "doctor6.png";
  static final hospital1 = BaseImageUrl + "hospital1.png";
  static final hospital2 = BaseImageUrl + "hospital2.png";
  static final hospital3 = BaseImageUrl + "hospital3.png";
  static final hospital4 = BaseImageUrl + "hospital4.png";
  static final search2 = BaseImageUrl + "search2.png";
  static final search1 = BaseImageUrl + "search1.png";
  static final search3 = BaseImageUrl + "search3.png";
  static final search4 = BaseImageUrl + "search4.png";
  static final search5 = BaseImageUrl + "search5.png";
  static final schedule = BaseImageUrl + "Schedule.png";
  static final paymentMethod = BaseImageUrl + "paymentMethod.png";
  static final card = BaseImageUrl + "card.png";
  static final doctorGroup = BaseImageUrl + "doctorGroup.jpg";
  static final covid1 = BaseImageUrl + "covid1.jpg";
  static final covid2 = BaseImageUrl + "covid2.jpg";
  static final covid3 = BaseImageUrl + "covid3.jpg";
  static final covid4 = BaseImageUrl + "covid4.jpg";
  static final fbIcon = BaseImageUrl + "fbIcon.png";
  static final insta = BaseImageUrl + "insta.png";
  static final messanger = BaseImageUrl + "messanger.png";
  static final twitter = BaseImageUrl + "twitter.png";
  static final whIcon = BaseImageUrl + "whIcon.png";
  static final activity1 = BaseImageUrl + "activity1.png";
  static final activity2 = BaseImageUrl + "activity2.png";
  static final activity3 = BaseImageUrl + "activity3.png";
  static final waitforpay = BaseImageUrl + "waitforpay.png";
  static final endocrine = BaseImageUrl + "endocrine.png";
  static final appicon = BaseImageUrl + "app_logo.png";
  static final appicon2 = BaseImageUrl + "app_logo2.png";
  static final home_banner = BaseImageUrl + "home_banner.jpg";
  static final service1 = BaseImageUrl + "washing-machine.png";
  static final service2 = BaseImageUrl + "electronics.png";
  static final service3 = BaseImageUrl + "plumber.png";

  static String access_token = '';

  static profile? prof;

  static void setProfile(profile profData) {
    prof = profData;
  }

  static void setAccessToken(String token) async {
    access_token = 'Bearer ${token}';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged_in', true);
    prefs.setString('access_token', 'Bearer ${token}');
  }

  static String city = '';
  static String pincode = '';
  static int? category_id = 1;
  static int? sub_category_id = 0;
  static int? sub_to_sub_category_id = 0;
  static FragNavigate? fragNav;
  static PersistentTabController? navController;
  static LastQuery? last_query;
  static List<banner> bannerList = List.empty();
  static List<City> cityList = List.empty();
  static List<text_banner> textList = new List.empty();
  static List<category> categoryList = new List.empty();
  static List<Review> reviewList = [];
  static String queryId = '';
  static List<query_offers> offersList = [
    query_offers(
      'Gaurav',
      'https://images.pexels.com/photos/239548/pexels-photo-239548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      '100',
      4.5,
    ),
    query_offers(
      'Rahul',
      'https://images.pexels.com/photos/263194/pexels-photo-263194.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      '200',
      4.3,
    ),
  ];
  static List<Posit> screens = <Posit>[
    Posit(
      key: "Home",
      title: "Home",
      fragment: HomeScreen(),
      icon: Image.asset('assets/home.png'),
    ),
    Posit(
      key: "FAQ",
      title: "Tips",
      fragment: FAQ_PAGE(),
      icon: Image.asset('assets/appicon.png'),
    ),
    Posit(
      key: "Query",
      title: "Query",
      fragment: MyQuery(),
      icon: Image.asset('assets/sent.png'),
    ),
    // Posit(
    //   key: "Wallet",
    //   title: "Wallet",
    //   // fragment: WinnerPage(),
    //   fragment: ProfileScreen(
    //     callback: (bool) {},
    //   ),
    //   icon: Image.asset('assets/money.png'),
    // ),
    Posit(
      key: "Profile",
      title: "Profile",
      fragment: ProfileScreen(
        callback: (bool) {},
      ),
      icon: Image.asset('assets/user.png'),
    ),

    Posit(
      key: "AllScreen1",
      title: "Home",
      fragment: AllScreen1(
        callback: (bool) {},
      ),
      icon: Image.asset('assets/home.png'),
    ),
    Posit(
      key: "AllScreen2",
      title: "Home",
      fragment: AllScreen2(
        callback: (bool) {},
      ),
      icon: Image.asset('assets/home.png'),
    ),
    Posit(
      key: "QueryOffers",
      title: "QueryOffers",
      fragment: QueryOffers(),
      icon: Image.asset('assets/home.png'),
    ),
    Posit(
      key: "VendorsProfile",
      title: "QueryOffers",
      fragment: VendorsProfile(),
      icon: Image.asset('assets/home.png'),
    ),
  ];

  static get list {
    return screens;
  }
}
