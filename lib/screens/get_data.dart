import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training/styles/colors.dart' as color;

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({Key? key}) : super(key: key);

  @override
  _GetDataScreenState createState() => _GetDataScreenState();
}

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;

class _GetDataScreenState extends State<GetDataScreen> {
  String url = 'https://reqres.in/api/users?page=2';

  Future apiService() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['data'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color.AppColor.yellowClr,
          title: const Text(
            'MODULE',
            style: TextStyle(letterSpacing: 5),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    children: const [
                      // const Text(
                      //   'Module',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      // Expanded(child: Container()),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search_outlined,
                        size: 20,
                      ),
                      Text('search'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(listResponse![index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 20),
                                    child: Image.network(
                                        listResponse![index]['avatar']),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            listResponse![index]['first_name']),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(listResponse![index]['last_name']),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(listResponse![index]['email']),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: listResponse!.length,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
