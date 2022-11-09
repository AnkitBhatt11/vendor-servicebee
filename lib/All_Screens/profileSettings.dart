import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
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
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "All_Screens Settings",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(letterSpacing: 0.1, fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyText1!.color),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 170,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Theme.of(context).backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14, right: 14, top: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline_outlined,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      "Jessica jung",
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).textTheme.headline1!.color),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(Icons.more_vert_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "87 Crown Street London City",
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).textTheme.headline1!.color),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.attribution_rounded,
                                      color: Colors.cyanAccent,
                                    ),
                                    Text(
                                      "Female",
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                          letterSpacing: 0.1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).textTheme.headline1!.color),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170, left: 40, right: 40),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          "New All_Screens",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.1,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).canvasColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
