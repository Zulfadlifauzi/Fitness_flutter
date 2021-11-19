import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter your name',
                              labelStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your email',
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your phone number',
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: hidePassword,
                            controller: passwordController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter your password',
                                labelStyle: TextStyle(color: Colors.grey)),
                          ),
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
                          onPressed: () async {},
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
