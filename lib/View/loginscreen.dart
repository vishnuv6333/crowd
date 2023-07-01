import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../provider/authprovider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 22, 59, 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Image.asset("assets/img/logo.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome \nback to",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "IBMPlexSans",
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                    Text(
                      "CrowdAfrik",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(top: 9, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontFamily: "IBMPlexSans",
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        ),
                      ),
                      Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: HexColor('#F1F1F1'),
                                      label: Text(
                                        "Enter your phone number",
                                        style: TextStyle(
                                            color: HexColor('#707070'),
                                            fontFamily: "Axiforma",
                                            fontSize: 13),
                                      )),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter username!';
                                    }
                                    return null;
                                  },
                                    onChanged: (value) =>
                                      formData.setMobile(value),
                                  onSaved: (value) {},
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              SizedBox(height: 12,),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: HexColor('#F1F1F1'),
                                      label: Text(
                                        "Enter your password",
                                        style: TextStyle(
                                            color: HexColor('#707070'),
                                            fontFamily: "Axiforma",
                                            fontSize: 13),
                                      )),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Mobile';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                      formData.setPassword(value),
                                  onSaved: (value) {},
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          )),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Text("Forgot password ?"),
                          )),
                      InkWell(
                        onTap: () async {
                       
                          if (formKey.currentState!.validate() == true) {
                          
                            await formData.userlogin(context);
                           
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 306,
                          decoration: BoxDecoration(
                              color: HexColor('#FC153B'),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: const Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account yet? ",
                              style: TextStyle(fontFamily: "IBMPlexSans"),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(color: HexColor("FE2929")),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
