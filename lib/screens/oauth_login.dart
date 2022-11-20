import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:training/widgets/oauth_class.dart';

class Oauth2Login extends StatefulWidget {
  const Oauth2Login({Key? key}) : super(key: key);

  @override
  State<Oauth2Login> createState() => _Oauth2LoginState();
}

class _Oauth2LoginState extends State<Oauth2Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton.icon(
              onPressed: () {
                Oauth2ClientExample().fetchFiles();
              },
              icon: Icon(Icons.wallet),
              label: Text('Login OAuth'))),
    );
  }
}
