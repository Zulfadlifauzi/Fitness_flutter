import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/auth/login.dart';
import 'package:training/screens/video_info.dart';
import 'package:training/styles/colors.dart' as color;
import 'package:training/widgets/drawer_tab.dart';

import 'get_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _selectedDate = DateTime.now();

  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: color.AppColor.homePageBackground,
          title: Text(
            'Training',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: color.AppColor.homePageTitle),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today_outlined),
              color: Colors.black,
              tooltip: 'Show Snackbar',
              onPressed: () {
                _getDateFromuser();
              },
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: Colors.black,
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
        ),
        drawer: const DrawerTab(),
        backgroundColor: color.AppColor.homePageBackground,
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: 1000,
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(children: [
                // Row(
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         Get.to(const LoginScreen());
                //       },
                //       child: Icon(
                //         Icons.menu,
                //         size: 20,
                //         color: color.AppColor.homePageIcons,
                //       ),
                //     ),
                //     const SizedBox(width: 20),
                //     Text(
                //       'Training',
                //       style: TextStyle(
                //           fontSize: 30,
                //           color: color.AppColor.homePageTitle,
                //           fontWeight: FontWeight.w700),
                //     ),
                //     Expanded(child: Container()),
                //     Icon(
                //       Icons.arrow_back_ios,
                //       size: 20,
                //       color: color.AppColor.homePageIcons,
                //     ),
                //     IconButton(
                //         onPressed: () {
                //           _getDateFromuser();
                //         },
                //         icon: const Icon(
                //           Icons.calendar_today_outlined,
                //           size: 20,
                //         )),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Icon(
                //       Icons.arrow_forward_ios,
                //       size: 20,
                //       color: color.AppColor.homePageIcons,
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Text(
                      'Your program',
                      style: TextStyle(
                          fontSize: 20,
                          color: color.AppColor.homePageSubtitle,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Get.to(const VideoInfoScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageDetail,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: color.AppColor.homePageIcons,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2))
                    ],
                    gradient: LinearGradient(colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9)
                    ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(80)),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 25, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next workout',
                          style: TextStyle(
                              fontSize: 16,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'and Glutes Workout',
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '60 min',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: color
                                          .AppColor.homePageContainerTextSmall),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                        color: color.AppColor.gradientFirst,
                                        blurRadius: 10,
                                        offset: const Offset(4, 6))
                                  ]),
                              child: const Icon(
                                Icons.play_circle_fill,
                                color: Colors.white,
                                size: 60,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 40,
                                offset: const Offset(8, 10),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.3)),
                            BoxShadow(
                                blurRadius: 40,
                                offset: const Offset(-1, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.3)),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 200),
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/wo.png'),
                            )),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: const EdgeInsets.only(left: 165, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You are doing great',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: color.AppColor.homePageDetail),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: 'Keep it up\n',
                                    style: TextStyle(
                                        color: color.AppColor.homePagePlanColor,
                                        fontSize: 16),
                                    children: const [
                                  TextSpan(text: 'Stick to your plan')
                                ]))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Area of focus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: color.AppColor.homePageTitle),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Get.to(const GetDataScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              fontSize: 18,
                              color: color.AppColor.homePageDetail,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: info.length.toDouble() ~/ 2,
                        itemBuilder: (_, i) {
                          int a = 2 * i;
                          int b = 2 * i + 1;
                          return Row(
                            children: [
                              Container(
                                  width:
                                      (MediaQuery.of(context).size.width - 90) /
                                          2,
                                  height: 170,
                                  margin: const EdgeInsets.only(
                                      left: 30, bottom: 15, top: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(info[a]['img'])),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(5, 5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(-5, -5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                      ]),
                                  child: Container(
                                    child: Center(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          info[a]['title'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: color
                                                  .AppColor.homePageDetail),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  width:
                                      (MediaQuery.of(context).size.width - 90) /
                                          2,
                                  height: 170,
                                  margin: const EdgeInsets.only(
                                      left: 30, bottom: 15, top: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(info[b]['img'])),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(5, 5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: const Offset(-5, -5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                      ]),
                                  child: Center(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        info[b]['title'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                color.AppColor.homePageDetail),
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        }),
                  ),
                ))
              ])),
        ));
  }

  _getDateFromuser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2022));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print('Its null bois');
    }
  }
}
