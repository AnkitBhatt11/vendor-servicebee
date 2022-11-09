// ignore_for_file: deprecated_member_use

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wellcare/constance/constance.dart';

import '../Model/SetQuery.dart';
import '../Model/Sub_To_Sub_Category.dart';
import '../Model/search_result.dart';
import '../Networking/AccessNetwork.dart';
import '../OtherScreens/search_page.dart';
import '../main.dart';
import 'all_screen.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:wellcare/Model/notification.dart' as nl;

class HomeScreen extends StatefulWidget {
  final void Function(int)? callback;

  const HomeScreen({Key? key, this.callback}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAll = true;
  bool isHealth = false;
  bool isNews = false;
  bool isCancer = false;
  bool isMedical = false;
  bool isLive = false;
  late List<search_result> search_results;
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _pincodeController = TextEditingController();
  var _addressController = TextEditingController();
  var _noteController = TextEditingController();
  String city = '';
  String city1 = '';
  late AlertDialog alert;
  var regex = RegExp(r'\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})');

  late FocusNode focusNode;

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

// bool badges = false ;
  List<nl.Notification> notifications = [];
  var badgeicon;
  void _onRefresh() async {
    // monitor network fetch
    int page = 1;
    final response = await access_network().getNotifications(page);
    if (response.status ?? false) {
      notifications = response.notifications ?? [];
      badgeicon = response.new_notification ?? 0;
      setState(() {});
    } else {}
    //  if(notifications.length == null )
    // if failed,use refreshFailed()
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
    focusNode = new FocusNode();

    // listen to focus changes
    focusNode.addListener(
        () => print('focusNode updated: hasFocus: ${focusNode.hasFocus}'));
    Future.delayed(Duration.zero, () {
      fetchProfile();
      fetchQuery();
      try {
        // city = ConstanceData.cityList[0].city ?? "";
        // city1 = ConstanceData.cityList[0].city ?? "";
      } catch (e) {
        print(e);
      }
    });
  }

  checkType() {
    for (var i in ConstanceData.categoryList) {
      if (i.id == ConstanceData.category_id) {
        return i.is_citytocity;
      }
    }
    return false;
  }

  bool isNumeric(String str) {
    RegExp _numeric = RegExp(r'^-?[0-9]+$');
    return _numeric.hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
      ),
    );
    return Scaffold(
      body: Container(
        // height:MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        // color: Color(0xffF4F4F4),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              )),
                          child: TextFormField(
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38,
                                    ),
                            onChanged: (txt) {
                              if (search_results.length >= 1 && txt == '') {
                                setState(() {
                                  search_results = List.empty();
                                });
                              } else {
                                if (txt != '') {
                                  fetchList1(txt);
                                }
                              }
                            },
                            onFieldSubmitted: (txt) {
                              print(txt);
                              if (search_results.length >= 1 && txt == '') {
                                setState(() {
                                  search_results = List.empty();
                                });
                              } else {
                                if (txt != '') {
                                  fetchList(txt);
                                }
                              }
                            },
                            onSaved: (txt) {
                              print(txt);
                              if (search_results.length >= 1 && txt == '') {
                                setState(() {
                                  search_results = List.empty();
                                });
                              }
                              //  else {
                              //   if (txt != '') {
                              //     fetchList(txt);
                              //   }
                              // }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 14, right: 14, top: 10),
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        letterSpacing: 0.1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black38,
                                      ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black45,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        InkWell(
                          onTap: () async {
                            await access_network().readNotification();
                            Navigator.pushNamed(context, Routes.Notification)
                                .then((value) => _onRefresh());
                          },
                          child: Badge(
                            position: BadgePosition.topEnd(top: -6, end: -5),
                            showBadge: badgeicon == 0 ? false : true,
                            badgeColor: Color(0xffF19511),
                            borderRadius: BorderRadius.circular(20),
                            badgeContent: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 8,
                                color: Color(0xffF19511),
                              ),
                            ),
                            child: InkWell(
                              // onTap: () async {
                              //   await access_network().readNotification();
                              //   Navigator.pushNamed(context, Routes.Notification);
                              // },
                              child: Icon(
                                (Icons.notifications),
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    search_results.length > 0
                        ? Container(
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 0.5,
                              ),
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: search_results.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = search_results[index];
                                return GestureDetector(
                                  onTap: () {
                                    switch (data.id) {
                                      case 0:
                                        print('categ ${data.categ?.id}');
                                        ConstanceData.category_id =
                                            data.categ?.id;
                                        ConstanceData.fragNav
                                            ?.putPosit(key: 'AllScreen1');
                                        break;
                                      case 1:
                                        print(
                                            'sub categ ${data.sub_categ?.id}');
                                        ConstanceData.sub_category_id =
                                            data.sub_categ?.id;
                                        ConstanceData.fragNav
                                            ?.putPosit(key: 'AllScreen2');
                                        break;
                                      default:
                                        print(
                                            'sub to sub categ ${data.sub_to_sub_categ?.is_pincode}');
                                        show(
                                            data.sub_to_sub_categ?.is_pincode,
                                            data.sub_to_sub_categ
                                                ?.is_within_city,
                                            data.sub_to_sub_categ
                                                ?.is_citytocity,
                                            data.sub_to_sub_categ);
                                        // _displayTextInputDialog(
                                        //     context, data.sub_to_sub_categ);
                                        break;
                                    }
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
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
                                                    'https://growgraphics.xyz/service-bee/public/${getImage(data)}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${getText(data)}",
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${getDescriptor(data)}",
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            // child: Text("No results found !"),
                            ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              AllScreen(
                (val) {
                  setState(() {
                    print('base home ${val}');
                    widget.callback!(val);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchProfile() async {
    showLoaderDialog(context);
    access_network().show_user_profile().then((_) {
      setState(() {
        ConstanceData.setProfile(_);
        Navigator.pop(context);
        fetchBanner();
        fetchCity();
      });
    });
  }

  showLoaderDialog(BuildContext context) {
    alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void fetchBanner() async {
    access_network().banner_list().then((_) {
      if (mounted) {
        setState(() {
          ConstanceData.bannerList = _;
        });
      } else {}
    });
    access_network().textbanner_list().then((_) {
      if (mounted) {
        setState(() {
          ConstanceData.textList = _;
        });
      } else {}
    });
  }

  void fetchCity() async {
    access_network().city_list().then((_) {
      if (mounted) {
        setState(() {
          ConstanceData.cityList = _;
        });
      } else {}
    });
  }

  void fetchList(term) async {
    showLoaderDialog(context);
    access_network().match_keywords(term).then((_) {
      setState(() {
        search_results = _;
        Navigator.pop(context);
      });
    });
  }

  void fetchList1(term) async {
    //  showLoaderDialog(context);
    access_network().match_keywords(term).then((_) {
      setState(() {
        search_results = _;
        //   Navigator.pop(context);
      });
    });
  }

  void fetchQuery() async {
    access_network().last_query().then((_) {
      setState(() {
        ConstanceData.last_query = _;
      });
    });
  }

  getText(search_result data) {
    switch (data.id) {
      case 0:
        return data.categ?.name;
      case 1:
        return data.sub_categ?.sc_name;
      default:
        return data.sub_to_sub_categ?.ssc_name;
    }
  }

  void fetchData(bool is_pincity) {
    print(is_pincity);
    print(isNumeric(_pincodeController.text));
    if (ConstanceData.last_query != null &&
        ConstanceData.last_query?.name != "") {
      _nameController.text = ConstanceData.last_query?.name ?? "";
      _addressController.text = ConstanceData.last_query?.address ?? "";
      _phoneController.text = ConstanceData.last_query?.phno ?? "";
      if (is_pincity && isNumeric(_pincodeController.text)) {
        _pincodeController.text = ConstanceData.last_query?.pin_city ?? "";
      } else if (is_pincity && !isNumeric(_pincodeController.text)) {
      } else {
        _pincodeController.text = ConstanceData.last_query?.pin_city ?? "";
      }
      _noteController.text = ConstanceData.last_query?.note ?? "";
    } else {
      _phoneController.text = ConstanceData.prof?.phone ?? "";
    }
  }

  Future<void> _pincodeQueryDialog(
      BuildContext context, sub_to_sub_category? service) async {
    var currentAgree = true;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) SetState) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Book Your Service',
                                style: TextStyle(
                                  // color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${service?.ssc_name}',
                                style: TextStyle(
                                  color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: 430,
                        // width: 900,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _nameController,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter your fullname",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        enabled: false,
                                        onChanged: (value) {},
                                        controller: _phoneController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        maxLength: 10,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: "Enter your mobile number",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        toolbarOptions: ToolbarOptions(
                                          copy: true,
                                          cut: false,
                                          paste: false,
                                          selectAll: false,
                                        ),
                                        controller: _pincodeController,
                                        keyboardType: TextInputType.number,
                                        maxLength: 6,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: "Pincode",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _addressController,
                                        decoration: InputDecoration(
                                          hintText: "Address",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        maxLength: 200,
                                        keyboardType: TextInputType.multiline,
                                        focusNode: focusNode,
                                        minLines: focusNode.hasFocus ? 1 : null,
                                        maxLines: focusNode.hasFocus ? 2 : null,
                                        toolbarOptions: ToolbarOptions(
                                          copy: true,
                                          cut: false,
                                          paste: false,
                                          selectAll: false,
                                        ),
                                        onChanged: (value) {},
                                        controller: _noteController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[ a-zA-Z]")),
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(3.0),
                                          hintText:
                                              "Additional Note (Optional)",
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  // color: Colors.black45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                          value: currentAgree,
                                          onChanged: (val) {
                                            SetState(() {
                                              currentAgree = !currentAgree;
                                            });
                                          }),
                                      GestureDetector(
                                        onTap: () {
                                          showAlertDialog(context);
                                        },
                                        child: Text(
                                          'I accept Terms & Conditions',
                                          style: TextStyle(
                                            color: Color(0xffF19613),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Your booking has been successful
                                  if (_nameController.text.isNotEmpty &&
                                      _phoneController.text.isNotEmpty &&
                                      _pincodeController.text.isNotEmpty &&
                                      _addressController.text.isNotEmpty &&
                                      //  _noteController.text.isNotEmpty &&
                                      _phoneController.text.length == 10 &&
                                      (isNumeric(_pincodeController.text)
                                          ? _pincodeController.text.length == 6
                                          : true) &&
                                      currentAgree) {
                                    if (!regex.hasMatch(_noteController.text)) {
                                      saveQuerry(service, null);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Mobile number not acceptable",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Enter all the details properly",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text('SUBMIT',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });

    fetchData(service?.is_pincode);
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Terms and Conditions'),
            content: Container(
              height: 150,
              child: Center(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam'),
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> _city_city_QueryDialog(
      BuildContext context, sub_to_sub_category? service) async {
    var currentAgree = true;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) SetState) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Book Your Service',
                                style: TextStyle(
                                  // color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${service?.ssc_name}',
                                style: TextStyle(
                                  color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // height: 430,
                        // width: 900,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                // height: 360,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _nameController,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter your fullname",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        enabled: false,
                                        onChanged: (value) {},
                                        controller: _phoneController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        maxLength: 10,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: "Enter your mobile number",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    StatefulBuilder(builder: (context, _) {
                                      return GestureDetector(
                                        onTap: () async {
                                          final result =
                                              await _handlePressButton();
                                          // await Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) =>
                                          //         SearchPage(),
                                          //   ),
                                          // );
                                          print('result ${result}');
                                          if (result != null) {
                                            _(() {
                                              setState(() {
                                                city1 = result.toString();
                                              });
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Color(0xffFAFAFA),
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(city1 == ''
                                                  ? ' Enter cityFrom (Required)'
                                                  : city1),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    StatefulBuilder(builder: (context, _) {
                                      return GestureDetector(
                                        onTap: () async {
                                          final result =
                                              await _handlePressButton();
                                          //  await Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) =>
                                          //         SearchPage(),
                                          //   ),
                                          // );
                                          print('result ${result}');
                                          if (result != null) {
                                            _(() {
                                              setState(() {
                                                city = result.toString();
                                              });
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Color(0xffFAFAFA),
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(city == ''
                                                  ? ' Enter cityTo (Required)'
                                                  : city),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(height: 8),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _addressController,
                                        decoration: InputDecoration(
                                          hintText: "Address",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        maxLength: 200,
                                        keyboardType: TextInputType.multiline,
                                        focusNode: focusNode,
                                        minLines: focusNode.hasFocus ? 1 : null,
                                        maxLines: focusNode.hasFocus ? 2 : null,
                                        onChanged: (value) {},
                                        controller: _noteController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[ a-zA-Z]")),
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(3.0),
                                          hintText:
                                              "Additional Note (Optional)",
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  // color: Colors.black45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                          value: currentAgree,
                                          onChanged: (val) {
                                            SetState(() {
                                              currentAgree = !currentAgree;
                                            });
                                          }),
                                      GestureDetector(
                                        onTap: () {
                                          showAlertDialog(context);
                                        },
                                        child: Text(
                                          'I accept Terms & Conditions',
                                          style: TextStyle(
                                            color: Color(0xffF19613),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Your booking has been successful
                                  if (_nameController.text.isNotEmpty &&
                                      _phoneController.text.isNotEmpty &&
                                      _addressController.text.isNotEmpty &&
                                      //   _noteController.text.isNotEmpty &&
                                      _phoneController.text.length == 10 &&
                                      currentAgree) {
                                    if (!regex.hasMatch(_noteController.text)) {
                                      saveQuerry(service, city1);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Mobile number not acceptable",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Enter all the details properly",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text('SUBMIT',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });

    fetchData(service?.is_pincode);
  }

  Future<void> _within_city_QueryDialog(
      BuildContext context, sub_to_sub_category? service) async {
    var currentAgree = true;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) SetState) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Book Your Service',
                                style: TextStyle(
                                  // color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${service?.ssc_name}',
                                style: TextStyle(
                                  color: Color(0xffF19613),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // height: 430,
                        // width: 900,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                // height: 360,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _nameController,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter your fullname",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        enabled: false,
                                        onChanged: (value) {},
                                        controller: _phoneController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        maxLength: 10,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          hintText: "Enter your mobile number",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    StatefulBuilder(builder: (context, _) {
                                      return GestureDetector(
                                        onTap: () async {
                                          final result =
                                              await _handlePressButton();
                                          // await Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (BuildContext context) =>
                                          //         SearchPage(),
                                          //   ),
                                          // );
                                          print('result ${result}');
                                          if (result != null) {
                                            _(() {
                                              setState(() {
                                                city = result.toString();
                                              });
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            color: Color(0xffFAFAFA),
                                            border: Border.all(
                                              color: Colors.grey.shade500,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(city == ''
                                                  ? ' Enter city (Required)'
                                                  : city),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(height: 8),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        onChanged: (value) {},
                                        controller: _addressController,
                                        decoration: InputDecoration(
                                          hintText: "Address",
                                          contentPadding: EdgeInsets.all(3.0),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.all(3),
                                    //   decoration: BoxDecoration(
                                    //     color: Color(0xffFAFAFA),
                                    //     border: Border.all(
                                    //       color: Colors.grey.shade500,
                                    //     ),
                                    //     borderRadius: BorderRadius.all(
                                    //       Radius.circular(5),
                                    //     ),
                                    //   ),
                                    //   child: TextField(
                                    //     onChanged: (value) {},
                                    //     controller: _addressController,
                                    //     decoration: InputDecoration(
                                    //       hintText: "Address",
                                    //       contentPadding: EdgeInsets.all(3.0),
                                    //       focusedBorder: InputBorder.none,
                                    //       enabledBorder: InputBorder.none,
                                    //       errorBorder: InputBorder.none,
                                    //       disabledBorder: InputBorder.none,
                                    //     ),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFAFAFA),
                                        border: Border.all(
                                          color: Colors.grey.shade500,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: TextField(
                                        maxLength: 200,
                                        keyboardType: TextInputType.multiline,
                                        focusNode: focusNode,
                                        minLines: focusNode.hasFocus ? 1 : null,
                                        maxLines: focusNode.hasFocus ? 2 : null,
                                        onChanged: (value) {},
                                        controller: _noteController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[ a-zA-Z]")),
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(3.0),
                                          hintText:
                                              "Additional Note (Optional)",
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Container(
                                  // color: Colors.black45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                          value: currentAgree,
                                          onChanged: (val) {
                                            SetState(() {
                                              currentAgree = !currentAgree;
                                            });
                                          }),
                                      GestureDetector(
                                        onTap: () {
                                          showAlertDialog(context);
                                        },
                                        child: Text(
                                          'I accept Terms & Conditions',
                                          style: TextStyle(
                                            color: Color(0xffF19613),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  //Your booking has been successful
                                  if (_nameController.text.isNotEmpty &&
                                      _phoneController.text.isNotEmpty &&
                                      _addressController.text.isNotEmpty &&
                                      // _noteController.text.isNotEmpty &&
                                      _phoneController.text.length == 10 &&
                                      currentAgree) {
                                    if (!regex.hasMatch(_noteController.text)) {
                                      saveQuerry(service, null);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Mobile number not acceptable",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Enter all the details properly",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text('SUBMIT',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });

    fetchData(service?.is_pincode);
  }

  void saveQuerry(sub_to_sub_category? service, String? city2) async {
    access_network()
        .create_query(set_query(
      service?.id.toString(),
      _nameController.text,
      _phoneController.text.toString(),
      getPinCity(service),
      getAddress(service),
      _noteController.text,
      city2,
    ))
        .then((_) {
      Fluttertoast.showToast(
          msg: "${_}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    });
  }

  getPinCity(sub_to_sub_category? service) {
    if (service?.is_citytocity ?? false) {
      return city;
    } else if (service?.is_within_city) {
      return city;
    } else {
      return _pincodeController.text.toString();
    }
  }

  getAddress(sub_to_sub_category? service) {
    if (service?.is_pincode ?? false) {
      return _addressController.text;
    } else {
      return _addressController.text;
    }
  }

  getImage(search_result data) {
    switch (data.id) {
      case 0:
        return data.categ?.image;
      case 1:
        return data.sub_categ?.sc_image;
      default:
        return data.sub_to_sub_categ?.ssc_image;
    }
  }

  getDescriptor(search_result data) {
    switch (data.id) {
      case 0:
        return data.categ?.description;
      case 1:
        return data.sub_categ?.sc_description;
      default:
        return data.sub_to_sub_categ?.ssc_description;
    }
  }

  void show(
      bool is_pincode, bool is_within_city, bool? is_citytocity, service) {
    if (is_pincode) {
      print('categ 1');
      _pincodeQueryDialog(context, service);
    } else if (is_within_city) {
      print('categ 2');
      _within_city_QueryDialog(context, service);
    } else {
      print('categ 3');
      _city_city_QueryDialog(context, service);
    }
  }

  _handlePressButton() async {
    try {
//final center = await getUserLocation();
      Prediction? p = await PlacesAutocomplete.show(
        context: context,
        strictbounds: false,
        apiKey: "AIzaSyC-29KZIc0M_3Yw3LQXDjx3dg7ifMRUyhg",
        components: [Component(Component.country, "in")],
//onError: onError,
        mode: Mode.overlay,
        language: "en",
        types: ["(cities)"] ?? [],
      );
// location: center == null
// ? null
// : Location(center.latitude, center.longitude),
// radius: center == null ? null : 10000);

//showDetailPlace(p.placeId);
      return p?.description?.split(',')[0];
    } catch (e) {
      return;
    }
  }
}

class LookingForList {
  String img;
  String txt;

  LookingForList(this.img, this.txt);
}

class Images {
  String img;

  Images(this.img);
}
