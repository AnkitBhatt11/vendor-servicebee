import 'package:flutter/material.dart';

import '../Model/faq_object.dart';

class FAQ_PAGE extends StatefulWidget {
  const FAQ_PAGE({Key? key}) : super(key: key);

  @override
  State<FAQ_PAGE> createState() => _FAQ_PAGEState();
}

class _FAQ_PAGEState extends State<FAQ_PAGE> {
  var faqs = [
    FAQ_Obj('What is Service Bee?',
        'Service Bee is a app the allows us to book any service and avail it in comfort of our home.'),
    FAQ_Obj('What does Service Bee do?',
        'Service Bee is a app the allows us to book any service and avail it in comfort of our home.'),
    FAQ_Obj('How to pay?',
        'Service Bee is a app the allows us to book any service and avail it in comfort of our home.'),
    FAQ_Obj('How to ask for refund?',
        'Service Bee is a app the allows us to book any service and avail it in comfort of our home.'),
    FAQ_Obj('How to book a service?',
        'Step1: Lorem ipsum dolor sit amet.\nStep2: consectetur adipiscing elit, sed do eiusmod tempor incididunt.\nStep3:  ut labore et dolore magna aliqua. Ut enim ad minim veniam.'),
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Tips",
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
              height: 10,
            ),
            ListView.separated(
              key: Key('builder ${selected.toString()}'),
              shrinkWrap: true,
              itemBuilder: (cont, pos) {
                var current = faqs[pos];
                return ExpansionTile(
                  key: Key(pos.toString()), //attention
                  initiallyExpanded: pos == selected,
                  onExpansionChanged: ((newState) {
                    if (newState)
                      setState(() {
                        Duration(seconds: 20000);
                        selected = pos;
                      });
                    else
                      setState(() {
                        selected = -1;
                      });
                  }),
                  //   initiallyExpanded: true,
                  title: Text(current.question ?? ""),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        current.answer ?? "",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: faqs.length,
            ),
            // SizedBox(
            //   height: 160 * _heightScale,
            // ),
            // Container(
            //   color: Colors.grey[200],
            //   height: 80 * _heightScale,
            //   child: Center(
            //       child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             // Navigator.push(context,
            //             //     MaterialPageRoute(builder: (context) => InviteFriends()));
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Icon(Icons.call),
            //               Text(
            //                 'CALL US',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16 * _widthScale),
            //               ),
            //             ],
            //           ),
            //           style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all(
            //                 Color.fromARGB(255, 255, 208, 0)),
            //             fixedSize: MaterialStateProperty.all(
            //                 Size(170 * _widthScale, 40 * _heightScale)),
            //             shape:
            //                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //                     RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(5.0),
            //                         side: BorderSide(color: Colors.yellow))),
            //           )
            //           // fixedSize: Size(120, 40),
            //           // primary: Colors.red,
            //           //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
            //           ),
            //       ElevatedButton(
            //           onPressed: () {
            //             // Navigator.push(context,
            //             //     MaterialPageRoute(builder: (context) => InviteFriends()));
            //           },
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Icon(Icons.mail),
            //               Text(
            //                 'MAIL US',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.w500,
            //                     fontSize: 16 * _widthScale),
            //               ),
            //             ],
            //           ),
            //           style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all(
            //                 Color.fromARGB(255, 255, 208, 0)),
            //             fixedSize: MaterialStateProperty.all(
            //                 Size(170 * _widthScale, 40 * _heightScale)),
            //             shape:
            //                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //                     RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(5.0),
            //                         side: BorderSide(color: Colors.yellow))),
            //           )
            //           // fixedSize: Size(120, 40),
            //           // primary: Colors.red,
            //           //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
            //           ),
            //     ],
            //   )),
            // ),
          ],
        ),
      ),
    );
  }
}
