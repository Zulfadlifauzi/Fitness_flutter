import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training/screens/get_data.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

String? stringResponse;
Map? mapResponse;
List? listResponse;

class _GetDataState extends State<GetData> {
  String url = 'https://reqres.in/api/users?page=2';
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET Form'),
      ),
      body: ListView.builder(
        itemCount: listResponse == null ? 0 : listResponse!.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Image.network(listResponse![index]['avatar']),
                Text(listResponse![index]['first_name']),
                Text(listResponse![index]['last_name']),
                Text(listResponse![index]['email']),
              ],
            ),
          );
        },
      ),
    );
  }
}
