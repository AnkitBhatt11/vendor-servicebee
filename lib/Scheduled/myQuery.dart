// ignore_for_file: deprecated_member_use

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/Query.dart';
import '../Networking/AccessNetwork.dart';
import '../constance/constance.dart';

class MyQuery extends StatefulWidget {
  final void Function(bool)? callback;

  const MyQuery({
    Key? key,
    this.callback,
  }) : super(key: key);

  @override
  _MyQueryState createState() => _MyQueryState();
}

class _MyQueryState extends State<MyQuery> with TickerProviderStateMixin {
  List<query> nameList = new List.empty();
  TabController? _controller;
  int selected = 0;
  List<query> nameLists = new List.empty();
  double rating = 0;

  var _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchQuery();

    _controller = TabController(length: 2, vsync: this);
    _controller?.addListener(() {
      setState(() {
        selected = _controller?.index ?? 0;
      });
      if (selected == 0) {
        fetchQuery();
      } else {
        fetchVerifiedQuery();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "My Query",
          style: Theme.of(context).textTheme.caption!.copyWith(
              letterSpacing: 0.1,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyText1!.color),
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              text: 'Recent',
            ),
            Tab(
              text: 'Verified',
            ),
            // Tab(icon: Icon(Icons.dire ctions_car)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          buildListView(nameList),
          buildListView1(nameLists),
          // Icon(Icons.directions_car, size: 350),
        ],
      ),
    );
  }

  ListView buildListView(list) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        query data = list[index];
        print('789${data.additional_note.toString().length}');
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Container(
                height: data.additional_note.toString().length > 180
                    ? 260
                    : data.additional_note.toString().length > 140
                        ? 240
                        : data.additional_note.toString().length > 100
                            ? 200
                            : data.additional_note.toString().length > 50
                                ? 180
                                : 150,
                // double.parse(
                //     data.additional_note.toString().length.toString()),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 15.0, top: 15.0, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Text(
                                  '${data.service_type}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: 40),
                                // child: Badge(
                                //   badgeColor: Color(0xffF19511),
                                //   borderRadius:
                                //       BorderRadius.circular(20),
                                //   badgeContent: Text(
                                //     '3',
                                //     style: TextStyle(
                                //       fontSize: 12,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                //   child: Icon(
                                //     Icons.mail,
                                //     size: 20,
                                //     color: Colors.grey.shade700,
                                //   ),
                                // ),
                                child: GestureDetector(
                                  onTap: () {
                                    if (selected == 0) {
                                      setState(() {
                                        ConstanceData.queryId =
                                            data.id.toString();
                                      });
                                      ConstanceData.fragNav?.putPosit(
                                        key: 'QueryOffers',
                                      );
                                    }
                                  },
                                  child: Badge(
                                    badgeColor: Color(0xffF19511),
                                    borderRadius: BorderRadius.circular(20),
                                    badgeContent: Text(
                                      data.lead_requets_count == null
                                          ? '0'
                                          : '${data.lead_requets_count}' ?? '0',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.mail,
                                      size: 20,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xffF19511),
                                    ),
                                    data.city2 != ""
                                        ? SizedBox(
                                            // width: 80,
                                            child: Text(
                                              '${data.city2}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            // width: 80,
                                            child: Text(
                                              '',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                    // SizedBox(
                                    //   width: 70,
                                    //   child: Column(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         '${data.pincode}',
                                    //         overflow: TextOverflow.ellipsis,
                                    //         style: TextStyle(
                                    //           fontSize: 12,
                                    //         ),
                                    //       ),
                                    //       isNumeric(data.pincode)
                                    //           ? Text(
                                    //               '${data.address}',
                                    //               overflow:
                                    //                   TextOverflow.ellipsis,
                                    //               style: TextStyle(
                                    //                 fontSize: 12,
                                    //               ),
                                    //             )
                                    //           : Container(),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: data.city2 != "" ? 20 : 5,
                                      child: Center(
                                        child: Text(
                                          data.city2 != "" ? '-' : '',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data.pincode}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          isNumeric(data.pincode)
                                              ? Text(
                                                  '${data.address}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    // data.city2 != ""
                                    //     ? SizedBox(
                                    //         // width: 80,
                                    //         child: Text(
                                    //           '${data.city2}',
                                    //           overflow: TextOverflow.ellipsis,
                                    //           style: TextStyle(
                                    //             fontSize: 12,
                                    //           ),
                                    //         ),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                // padding: EdgeInsets.only(left: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${data.date.toString().substring(8, 10)}' +
                                          '-' +
                                          '${data.date.toString().substring(5, 7)}' +
                                          '-' +
                                          '${data.date.toString().substring(0, 4)}',
                                      // '${data.date.toString().substring(11, 19)}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'OTP PIN:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.grey[100],
                            child: Text(
                              '${data.pin == "" ? "NA" : data.pin}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          // selected == 1
                          //     ? SizedBox(
                          //         height: 20,
                          //         child: ElevatedButton(
                          //           child: Text('Give Review'),
                          //           onPressed: () {
                          //             showReviewDialog(data.id ?? '0');
                          //           },
                          //           style: ElevatedButton.styleFrom(
                          //             primary: Colors.black,
                          //             padding: EdgeInsets.symmetric(
                          //                 horizontal: 1, vertical: 0),
                          //             textStyle: TextStyle(
                          //                 fontSize: 9,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //         ),
                          //       )
                          //     : Container(),
                        ],
                      ),
                      if (data.additional_note != null)
                        Expanded(
                          flex: data.additional_note.toString().length > 180
                              ? 3
                              : data.additional_note.toString().length > 140
                                  ? 2
                                  : 1,
                          child: Text(
                            'Note : ${data.additional_note == "" ? "NA" : data.additional_note}',
                            //  overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 14,
                              //  fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }

  ListView buildListView1(list) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        query data = list[index];
        print('78978787${data.additional_note.toString().length}');
        return Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Container(
                height: data.additional_note.toString().length > 180
                    ? 260
                    : data.additional_note.toString().length > 140
                        ? 240
                        : data.additional_note.toString().length > 100
                            ? 200
                            : data.additional_note.toString().length > 50
                                ? 180
                                : 150,
                // double.parse(
                //     data.additional_note.toString().length.toString()),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 15.0, top: 15.0, bottom: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: Text(
                                  '${data.service_type}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   flex: 1,
                            //   child: Container(
                            //     padding: EdgeInsets.only(left: 40),
                            //     // child: Badge(
                            //     //   badgeColor: Color(0xffF19511),
                            //     //   borderRadius:
                            //     //       BorderRadius.circular(20),
                            //     //   badgeContent: Text(
                            //     //     '3',
                            //     //     style: TextStyle(
                            //     //       fontSize: 12,
                            //     //       color: Colors.white,
                            //     //     ),
                            //     //   ),
                            //     //   child: Icon(
                            //     //     Icons.mail,
                            //     //     size: 20,
                            //     //     color: Colors.grey.shade700,
                            //     //   ),
                            //     // ),
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         if (selected == 0) {
                            //           setState(() {
                            //             ConstanceData.queryId =
                            //                 data.id.toString();
                            //           });
                            //           ConstanceData.fragNav?.putPosit(
                            //             key: 'QueryOffers',
                            //           );
                            //         }
                            //       },
                            //       child: Badge(
                            //         badgeColor: Color(0xffF19511),
                            //         borderRadius: BorderRadius.circular(20),
                            //         badgeContent: Text(
                            //           data.lead_requets_count == null
                            //               ? '0'
                            //               : '${data.lead_requets_count}' ?? '0',
                            //           style: TextStyle(
                            //             fontSize: 12,
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //         child: Icon(
                            //           Icons.mail,
                            //           size: 20,
                            //           color: Colors.grey.shade700,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Color(0xffF19511),
                                    ),
                                    data.city2 != ""
                                        ? SizedBox(
                                            // width: 80,
                                            child: Text(
                                              '${data.city2}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            // width: 80,
                                            child: Text(
                                              '',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                    // SizedBox(
                                    //   width: 70,
                                    //   child: Column(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.center,
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         '${data.pincode}',
                                    //         overflow: TextOverflow.ellipsis,
                                    //         style: TextStyle(
                                    //           fontSize: 12,
                                    //         ),
                                    //       ),
                                    //       isNumeric(data.pincode)
                                    //           ? Text(
                                    //               '${data.address}',
                                    //               overflow:
                                    //                   TextOverflow.ellipsis,
                                    //               style: TextStyle(
                                    //                 fontSize: 12,
                                    //               ),
                                    //             )
                                    //           : Container(),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: data.city2 != "" ? 20 : 5,
                                      child: Center(
                                        child: Text(
                                          data.city2 != "" ? '-' : '',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data.pincode}',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                          isNumeric(data.pincode)
                                              ? Text(
                                                  '${data.address}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    // data.city2 != ""
                                    //     ? SizedBox(
                                    //         // width: 80,
                                    //         child: Text(
                                    //           '${data.city2}',
                                    //           overflow: TextOverflow.ellipsis,
                                    //           style: TextStyle(
                                    //             fontSize: 12,
                                    //           ),
                                    //         ),
                                    //       )
                                    //     : Container(),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                // padding: EdgeInsets.only(left: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${data.date.toString().substring(8, 10)}' +
                                          '-' +
                                          '${data.date.toString().substring(5, 7)}' +
                                          '-' +
                                          '${data.date.toString().substring(0, 4)}',
                                      // '${data.date.toString().substring(11, 19)}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'OTP PIN:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            color: Colors.grey[100],
                            child: Text(
                              '${data.pin == "" ? "NA" : data.pin}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 20,
                            child: ElevatedButton(
                              child: Text('Give Review'),
                              onPressed: () {
                                showReviewDialog(data.id ?? '0');
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1, vertical: 0),
                                textStyle: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      if (data.additional_note != null)
                        Expanded(
                          flex: data.additional_note.toString().length > 180
                              ? 3
                              : data.additional_note.toString().length > 140
                                  ? 2
                                  : 1,
                          child: Text(
                            'Note : ${data.additional_note == "" ? "NA" : data.additional_note}',
                            //  overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 5,
                            style: TextStyle(
                              fontSize: 14,
                              //  fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        );
      },
    );
  }

  showReviewDialog(query_id) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Give the driver review'),
              content: StatefulBuilder(builder: (cont, stateSet) {
                return Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rate) {
                          setState(() {
                            rating = rate;
                          });
                        },
                      ),
                      Text("Please share your review"),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.0),
                          ),
                        ),
                        controller: _noteController,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        //Normal textInputField will be displayed
                        maxLines:
                            5, // when user presses enter it will adapt to it
                      )
                    ],
                  ),
                );
              }),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigation.instance.goBack();
                    // Navigation.instance.goBack();
                  },
                  child: Text('Go Back'),
                ),
                TextButton(
                  onPressed: () async {
                    if (_noteController.text.isNotEmpty) {
                      final response = await access_network()
                          .addReview(query_id, _noteController.text, rating);
                      if (response.status ?? false) {
                        Fluttertoast.showToast(
                            msg: "${response.message ?? "Successful"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        fetchVerifiedQuery();
                        Navigator.pop(context);
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                "${response.message ?? "Something went wrong"}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        Navigator.pop(context);
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please give rating",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: Text('Save'),
                )
              ],
            ));
  }

  void fetchQuery() async {
    access_network().user_query_list().then((_) {
      if (_.status ?? false) {
        if (mounted) {
          setState(() {
            nameList = _.queries ?? [];
          });
        } else {
          nameList = _.queries ?? [];
        }
      } else {
        if (mounted) {
          setState(() {
            nameList = [];
          });
        } else {
          nameList = [];
        }
      }
    });
  }

  void fetchVerifiedQuery() async {
    access_network().user_verified_query_list().then((_) {
      if (_.status ?? false) {
        if (mounted) {
          setState(() {
            nameLists = _.queries ?? [];
          });
        } else {
          nameLists = _.queries ?? [];
        }
      } else {
        if (mounted) {
          setState(() {
            nameLists = [];
          });
        } else {
          nameLists = [];
        }
      }
    });
  }

  bool isNumeric(String str) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
  }
}
