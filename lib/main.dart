import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellcare/Loading/loadingScreen.dart';
import 'package:wellcare/Local_Notification/local_notification.dart';
import 'package:wellcare/Sign/signIn.dart';
import 'package:wellcare/Splash/splashScreen.dart';
import 'package:wellcare/constance/theme.dart';

import 'Home/about_news_screen.dart';
import 'Home/primaryHomeScreen.dart';
import 'Notification/notification.dart';
import 'Splash/getting_started_page.dart';
import 'firebase_options.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

LocalNotification localNotification = LocalNotification();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //  'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
  //sound: RawResourceAndroidNotificationSound('whistlesound')
);

const AndroidNotificationDetails firstNotificationAndroidSpecifics =
    AndroidNotificationDetails(
  'high_importance_channel', // id
  'High Importance Notifications', // title
//  'This channel is used for important notifications.',
//  sound: RawResourceAndroidNotificationSound('whistlesound'),
  playSound: true,
  importance: Importance.high,
  priority: Priority.high,
);

const NotificationDetails firstNotificationPlatformSpecifics =
    NotificationDetails(android: firstNotificationAndroidSpecifics);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _messageHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // // setState()

  // //  sets
  // prefs.setString('status', "Pending");
  flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(
          android: AndroidNotificationDetails(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        //   'This channel is used for important notifications.',
        //   sound: RawResourceAndroidNotificationSound('whistlesound'),
        playSound: true,
        importance: Importance.high,
        priority: Priority.high,
      )),
      payload: jsonEncode({"Data": "Got it."}));

  // localNotification.showNotification(message.notification);
  print('background message ${message.notification!.body}');
  if (message.notification!.body == "You Can Now Accept The Orders") {
    FirebaseMessaging.onMessageOpenedApp.listen((snapshot) async {
      // print('ppoopopp');

      prefs.setString('status', "Pending");
      //Calls when the notification is been clicked.
      // localNotification.notificationRoute(snapshot.data);
      //  localNotification.showNotification(snapshot.notification);
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'service-bee-app',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //await Storage.instance.initializeStorage();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //globalSharedPref = await SharedPreferences.getInstance();
  Future.delayed(Duration(seconds: 5), () async {
    await localNotification.initializeLocalNotificationSettings();
  });

  // _notificationHandler();
  FirebaseMessaging.onMessage.listen((event) async {
    //  prefs.setString('status', "Pending");
    // localNotification.testNotification();
    // localNotification.showNotification(event.data.)
    localNotification.showNotification(event.data);
    print('event ${event.data['title']}');
    // localNotification.showNotification(event.notification);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((snapshot) async {
    print('ppoopopp');

    //  prefs.setString('status', "Pending");
    //Calls when the notification is been clicked.
    // localNotification.notificationRoute(snapshot.data);
    //  localNotification.showNotification(snapshot.notification);
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(new MyApp()));
}

class MyApp extends StatefulWidget {
  static setCustomeTheme(BuildContext context, int index) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setCustomeTheme(index);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setCustomeTheme(int index) {
    if (index == 6) {
      setState(() {
        AppTheme.isLightTheme = true;
      });
    } else if (index == 7) {
      setState(() {
        AppTheme.isLightTheme = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            AppTheme.isLightTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            AppTheme.isLightTheme ? Colors.white : Colors.black,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness:
            AppTheme.isLightTheme ? Brightness.dark : Brightness.light,
      ),
    );
    return MaterialApp(
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }

  var routes = <String, WidgetBuilder>{
    Routes.SPLASH: (BuildContext context) => SplashScreen(),
    Routes.Loading: (BuildContext context) => LoadingScreen(),
    Routes.Sign: (BuildContext context) => SignInScreen(),
    Routes.GETSTARTED: (BuildContext context) => GettingStarted(),
    // Routes.Home: (BuildContext context) => MainHomeScreen(),
    Routes.Home: (BuildContext context) => PrimaryMainScreen(),
    Routes.Notification: (BuildContext context) => NotificationScreen(),
  };
}

class Routes {
  static const String SPLASH = "/";
  static const String GETSTARTED = "/getstarted";
  static const String Sign = "/Sign/signIn";
  static const String Loading = "/Loading/loadingScreen";
  static const String Home = "/Home/mainHomeScreen";
  static const String Notification = "/Home/notification";
}
