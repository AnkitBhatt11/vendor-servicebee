import 'package:flutter/material.dart';

import 'package:wellcare/constance/constance.dart';

import 'ProfileScreen.dart';

class MessageScreen extends StatefulWidget {
  final ChatList doctorDetail;

  const MessageScreen({Key? key, required this.doctorDetail}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<MessageList> lstMessageList = [];
  @override
  void initState() {
    lstMessageList = [
      MessageList(
        "bhdbdd",
        "dcbhdcdd",
      ),
      MessageList(
        "bhdbdd",
        "dygdye",
      ),
      MessageList(
        "bhdbdd",
        "ygdydeytd",
      ),
      MessageList(
        "bhdbdd",
        "dgedftefd",
      ),
      MessageList(
        "bhdbdd",
        "dgedftefd",
      ),
      MessageList(
        "bhdbdd",
        "dgedftefd",
      ),
      MessageList(
        "bhdbdd",
        "dgedftefd",
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
        child: Column(
          children: [
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
                  widget.doctorDetail.txt1,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Expanded(child: SizedBox()),
                Container(
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
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: lstMessageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 19,
                                  backgroundImage: AssetImage(ConstanceData.doctor4),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      lstMessageList[index].message1,
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            letterSpacing: 0.6,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      lstMessageList[index].message2,
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                            letterSpacing: 0.6,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).canvasColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), color: Colors.grey[200]),
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.1,
                            fontSize: 15,
                            color: Colors.black38,
                          ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 14, top: 15),
                        border: InputBorder.none,
                        hintText: "Type your question here",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.1,
                              fontSize: 15,
                              color: Colors.black38,
                            ),
                        suffixIcon: Icon(
                          Icons.send,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageList {
  String message1;
  String message2;

  MessageList(this.message1, this.message2);
}
