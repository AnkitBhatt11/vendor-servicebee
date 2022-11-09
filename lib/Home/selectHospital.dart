import 'package:flutter/material.dart';
import 'package:wellcare/Home/pickTime.dart';
import 'package:wellcare/constance/constance.dart';

class SelectHospital extends StatefulWidget {
  @override
  _SelectHospitalState createState() => _SelectHospitalState();
}

class _SelectHospitalState extends State<SelectHospital> {
  List<HospitalList> lstHospitalList = [];
  @override
  void initState() {
    lstHospitalList = [
      HospitalList(
        ConstanceData.hospital1,
        "Mayao Clinic, Rochestet...",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital2,
        "Cleveland Clinic",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital3,
        "John Hopkins Hospital",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital4,
        "Mayao Clinic, Rochestet...",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital1,
        "Cleveland Clinic",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital2,
        "John Hopkins Hospital",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital3,
        "Mayao Clinic, Rochestet...",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
      HospitalList(
        ConstanceData.hospital4,
        "Cleveland Clinic",
        "99 Crown Streat London City",
        "4.5(834)",
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 14, right: 14),
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
                  "Select Hospital",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Nearst",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(letterSpacing: 0.1, fontSize: 15, color: Theme.of(context).textTheme.headline1!.color),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: lstHospitalList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PickTimeScreen(
                                        hospitalDetails: lstHospitalList[index],
                                      )));
                        },
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(image: AssetImage(lstHospitalList[index].img), fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15, left: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lstHospitalList[index].txt1,
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).textTheme.bodyText1!.color),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          lstHospitalList[index].txt2,
                                          style: Theme.of(context).textTheme.caption!.copyWith(
                                              letterSpacing: 0.1,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).textTheme.headline1!.color),
                                        ),
                                        SizedBox(
                                          height: 13,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow[800],
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              lstHospitalList[index].txt3,
                                              style: Theme.of(context).textTheme.caption!.copyWith(
                                                  letterSpacing: 0.1,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).textTheme.headline1!.color),
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                              height: 20,
                                              width: 60,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.cyan[100]),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 18,
                                                    color: Colors.cyan,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      "2 km",
                                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                                          letterSpacing: 0.1,
                                                          fontSize: 12,
                                                          color: Colors.cyan,
                                                          fontWeight: FontWeight.bold,
                                                          height: 1.2),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HospitalList {
  String img;
  String txt1;
  String txt2;

  String txt3;
  HospitalList(this.img, this.txt1, this.txt2, this.txt3);
}
