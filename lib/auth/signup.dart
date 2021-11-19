import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training/model/signup_model.dart';
import 'package:training/styles/colors.dart' as color;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassword = true;

  late SignupRequestModel signupModel;

  @override
  void initState() {
    signupModel = SignupRequestModel();
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register',
          style: GoogleFonts.staatliches(
              color: Colors.white, letterSpacing: 5, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: color.AppColor.bluishClr,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: const [
                    SizedBox(height: 50),
                    Text('Create an account, its free',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              onSaved: (input) => signupModel.name = input,
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your name',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Enter your name'),
                              ])),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              onSaved: (input) => signupModel.email = input,
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your email',
                                  labelStyle: TextStyle(color: Colors.grey)),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Enter your email'),
                                EmailValidator(errorText: 'Not A Valid Email')
                              ])),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              onSaved: (input) => signupModel.phone = input,
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your phone number',
                                  labelStyle: TextStyle(color: Colors.grey)),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Enter your phone number')
                              ])),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              onSaved: (input) => signupModel.password = input,
                              obscureText: hidePassword,
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter your password',
                                  labelStyle: TextStyle(color: Colors.grey)),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Enter your password'),
                                MinLengthValidator(6,
                                    errorText:
                                        'Should be at least 6 characters')
                              ])),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: color.AppColor.bluishClr,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: TextButton(
                          onPressed: () {
                            if (validateAndSave() == false &&
                                formKey.currentState!.validate() == false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please enter your information')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Successfully register')));
                            }
                            print(signupModel.toJson());
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
