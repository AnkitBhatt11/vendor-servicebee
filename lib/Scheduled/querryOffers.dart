import 'package:flutter/material.dart';
import 'package:wellcare/Networking/AccessNetwork.dart';

import '../Model/QueryOffers.dart';
import '../Model/vendor.dart';
import '../Model/vendor_review.dart';
import '../constance/constance.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QueryOffers extends StatefulWidget {
  const QueryOffers({Key? key}) : super(key: key);

  @override
  State<QueryOffers> createState() => _QueryOffersState();
}

class _QueryOffersState extends State<QueryOffers> {
  List<Vendor> vendors = [];
  List<List<VendorReview>> reviews = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Offers for query ",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1!.color),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: vendors.length,
              itemBuilder: (BuildContext context, int index) {
                Vendor data = vendors[index];
                return Column(
                  children: [
                    Card(
                        color: Colors.grey.shade100,
                        child: ExpansionTile(
                          backgroundColor: Colors.grey.shade100,
                          title: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(1),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                data.profile_picture ?? ""),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data.name ?? "",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data.phone ?? "",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data.email != ""
                                                    ? data.email ?? ""
                                                    : "Email not available",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // ConstanceData.fragNav
                                                  //     ?.putPosit(
                                                  //         key:
                                                  //             'VendorsProfile');
                                                },
                                                child: Container(
                                                  width: 45,
                                                  padding: EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        '${data.rating}',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              data.offer_price == null ||
                                                      data.offer_price == 'NA'
                                                  ? Container()
                                                  : Text(
                                                      data.offer_price
                                                                  .toString() ==
                                                              ''
                                                          ? ""
                                                          : 'Quotation : ${data.offer_price.toString()}',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .grey.shade900,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Reviews',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: reviews[index].length,
                                    itemBuilder: (cont, count) {
                                      var current = reviews[index][count];
                                      return Card(
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  current.name ?? "",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  // MainAxisAlignment
                                                  //     .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${current.rating}',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.black,
                                                      size: 15,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  current.review ?? "",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    }),
                              ],
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   color: Colors.grey.shade100,
                            //   child: Center(
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(
                            //           'Rate the vendor',
                            //           style: TextStyle(
                            //             fontSize: 14,
                            //             color: Colors.grey.shade900,
                            //           ),
                            //         ),
                            //         Container(
                            //           width: MediaQuery.of(context).size.width,
                            //           child: RatingBar.builder(
                            //             initialRating: 0,
                            //             minRating: 1,
                            //             direction: Axis.horizontal,
                            //             allowHalfRating: true,
                            //             itemCount: 5,
                            //             itemPadding: EdgeInsets.symmetric(
                            //                 horizontal: 4.0),
                            //             itemBuilder: (context, _) => Icon(
                            //               Icons.star,
                            //               color: Colors.amber,
                            //               size: 5,
                            //             ),
                            //             onRatingUpdate: (rating) {
                            //               print(rating);
                            //             },
                            //           ),
                            //         ),
                            //         Container(
                            //           padding: EdgeInsets.all(5),
                            //           width: MediaQuery.of(context).size.width,
                            //           child: Container(
                            //             padding: EdgeInsets.all(3),
                            //             decoration: BoxDecoration(
                            //               color: Color(0xffFAFAFA),
                            //               border: Border.all(
                            //                 color: Colors.grey.shade500,
                            //               ),
                            //               borderRadius: BorderRadius.all(
                            //                 Radius.circular(5),
                            //               ),
                            //             ),
                            //             child: TextField(
                            //               maxLines: 4,
                            //               onChanged: (value) {},
                            //               // controller: _noteController,
                            //               decoration: InputDecoration(
                            //                 contentPadding: EdgeInsets.all(3.0),
                            //                 hintText: "Additional Note",
                            //                 focusedBorder: InputBorder.none,
                            //                 enabledBorder: InputBorder.none,
                            //                 errorBorder: InputBorder.none,
                            //                 disabledBorder: InputBorder.none,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //         Card(
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius:
                            //                 BorderRadius.circular(10.0),
                            //           ),
                            //           child: Container(
                            //             decoration: BoxDecoration(
                            //               color: Colors.black,
                            //               borderRadius: BorderRadius.all(
                            //                 Radius.circular(10),
                            //               ),
                            //             ),
                            //             height: 40,
                            //             width:
                            //                 MediaQuery.of(context).size.width,
                            //             child: Center(
                            //               child: Text('SUBMIT',
                            //                   style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.white,
                            //                   )),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchLeads(ConstanceData.queryId);
  }

  void fetchLeads(String queryId) async {
    final result = await access_network().getVendorList(queryId);
    if (result.status ?? false) {
      if (mounted) {
        setState(() {
          vendors = result.vendors ?? [];
        });
      }
    }
    for (var i in vendors) {
      fetchReviews(i.vendor_id!);
    }
  }

  void fetchReviews(String id) async {
    final result = await access_network().getVendorReviews(id);
    if (result.status ?? false) {
      if (mounted) {
        setState(() {
          reviews.add(result.reviews ?? []);
        });
      }
    }
  }
}
