import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wellcare/Networking/AccessNetwork.dart';
import 'package:wellcare/Networking/NetworkHelper.dart';
import 'package:wellcare/constance/constance.dart';

import '../components/button.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  @override
  void fetchProfile() async {
    showLoaderDialog(context);
    access_network().show_user_profile().then((_) {
      if (mounted) {
        setState(() {
          ConstanceData.setProfile(_);
          Navigator.pop(context);
        });
      } else {}
    });
  }

  AlertDialog? alert;
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
        return alert!;
      },
    );
  }

  void initState() {
    super.initState();
    names = ConstanceData.prof?.name ?? "";
    email = ConstanceData.prof?.email ?? 'NA';
    addresss = ConstanceData.prof?.phone ?? "";
    Future.delayed(Duration.zero, () {
      fetchProfile();
    });
  }

  String names = '', phone_number = '', email = '', addresss = '';
  TextEditingController name = TextEditingController();
  TextEditingController account = TextEditingController();
  TextEditingController ifcs = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Help & Support",
          style: Theme.of(context).textTheme.caption!.copyWith(
                letterSpacing: 0.1,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
        ),
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              // color: Colors.indigo[100],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please fill up the form',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Name'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    // readOnly: true,
                    controller: name,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "Montserrat"),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: 'Enter name',
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Email'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: account,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "Montserrat"),
                    onChanged: (val) {},
                    //  readOnly: true,
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: 'Enter email',
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Phone'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    readOnly: true,
                    controller: ifcs,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "Montserrat"),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: addresss,
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Message'),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: address,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "Montserrat"),
                    onChanged: (val) {},
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: "Enter message",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        contentPadding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: Row(
                children: [
                  MaterialButton(
                    height: 48,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    onPressed: () {
                      Navigator.pop(context);
                      //    Navigation.instance.goBack();
                    },
                    child: const Text(
                      "BACK",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    color: Colors.grey[200],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Button(
                      onPressed: () async {
                        if ((name.text.isNotEmpty) &&
                            account.text.isNotEmpty &&
                            addresss != '' &&
                            address.text.isNotEmpty) {
                            
                          print(names);
                          print(addresss);
                          print(account.text);
                          print(address.text);
                          await sendHelp(
                              name.text, account.text, addresss, address.text);
                          Fluttertoast.showToast(
                              msg: "Form submitted successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pop(context);
                          //   requestDeactivate();
                        } else {
                          Fluttertoast.showToast(msg: 'Fill all the details');
                        }
                      },
                      text: "SUBMIT",
                    ),
                  ),
                ],
              ),
            ),
          )
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //     child: Button(
          //       onPressed: () {
          //         if (name.text.isNotEmpty &&
          //             account.text.isNotEmpty &&
          //             ifcs.text.isNotEmpty &&
          //             address.text.isNotEmpty) {
          //           requestDeactivate();
          //         } else {
          //           Fluttertoast.showToast(msg: 'Fill all the details');
          //         }
          //       },
          //       text: "Deactivate",
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }

  sendHelp(var name, var email, var phone, var message) async {
    NetworkHelper helper = NetworkHelper('');
    final response = await helper.sendHelpSupport(name, email, phone, message);
    if (response.status ?? false) {
      Fluttertoast.showToast(msg: response.message ?? "Successfull");
      // fetchLeads();
      // fetchPurchaseLeads();
      // fetchQuot();
    } else {
      showError(response.message ?? "Something Went Wrong");
    }
  }

  void showError(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
