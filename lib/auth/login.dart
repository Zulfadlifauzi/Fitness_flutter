import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:lottie/lottie.dart';
import 'package:training/auth/forgot_password.dart';
import 'package:training/auth/signup.dart';
import 'package:training/screens/home_screen.dart';
import 'package:training/ui/colors.dart' as color;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    bool hidePassword = true;

    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Hello Again,',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Lottie.asset('assets/lottie/learning.json'),
                ),
                TextFormField(
                    controller: emailController,
                    decoration:
                        const InputDecoration(labelText: 'Enter your email'),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your email'),
                      EmailValidator(errorText: 'Not A Valid Email')
                    ])),
                SizedBox(height: height * 0.05),
                TextFormField(
                  controller: passController,
                  decoration:
                      const InputDecoration(labelText: 'Enter your password'),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Enter your password'),
                    MinLengthValidator(6,
                        errorText: 'Should be at least 6 characters')
                  ]),
                  obscureText: hidePassword,
                ),
                SizedBox(height: height * 0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF363f93))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Dont have an account ? ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            Text('Register',
                                style: TextStyle(
                                    color: color.AppColor.bluishClr,
                                    fontSize: 15)),
                          ],
                        )),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: color.AppColor.bluishClr,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF363f93))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot password ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

//ignore: must_be_immutable
}
