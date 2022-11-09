import 'package:flutter/material.dart';

import '../Model/VendorRating.dart';

class VendorsProfile extends StatefulWidget {
  const VendorsProfile({Key? key}) : super(key: key);

  @override
  State<VendorsProfile> createState() => _VendorsProfileState();
}

class _VendorsProfileState extends State<VendorsProfile> {
  List<vendor_rating> list = [
    vendor_rating('Raj', 'Good service', 4.5),
    vendor_rating('KISHORE', 'Not satisfied', 1.5),
    vendor_rating('ALister', 'Excellent service', 5),
  ];

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
                  "Vendor information",
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
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                vendor_rating data = list[index];
                return Column(
                  children: [
                    Card(
                      color: Colors.grey.shade100,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        // radius: 30,
                                        child: ClipOval(
                                          child: Image.asset('assets/user.png',
                                          fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
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
                                            data.name,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade900,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: 45,
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.rating.toString(),
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
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${data.note}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade900,
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
                    ),
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
}
