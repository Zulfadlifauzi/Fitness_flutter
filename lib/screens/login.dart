import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:training/models/test_api.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class APIServices {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = 'https://reqres.in/api/login';
    final response =
        await http.post(Uri.parse(url), body: requestModel.tojson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response.statusCode);
      return LoginResponseModel.fromjson(json.decode(response.body));
    } else {
      throw Exception('Failed to send data');
    }
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _isObsecure = true;
  late LoginRequestModel requestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  @override
  void initState() {
    requestModel = LoginRequestModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 450,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('LOGIN',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: ('Email is required')),
                                EmailValidator(errorText: ('Invalid email'))
                              ]),
                              onSaved: (input) => requestModel.email = input,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email_outlined),
                                hintText: 'What do people call you?',
                                labelText: 'Email ',
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              validator: passwordValidator,
                              onSaved: (input) => requestModel.password = input,
                              obscureText: _isObsecure,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.lock_outline),
                                hintText: 'Your password',
                                labelText: 'Password ',
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          TextButton(
                              onPressed: () {
                                if (validateAndSave()) {
                                  print(requestModel.tojson());
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
