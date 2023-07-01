import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/img/splash.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill),
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.6,
                child: Container(
                  height: 290,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 9, left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Welcome to",
                          style: TextStyle(
                              fontFamily: "IBMPlexSans",
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 19, right: 19),
                          child: Text(
                            textAlign: TextAlign.justify,
                            "CrowdAfrik is a Financial technology (fintech) initiative with a broad range of ideas that aim to provide support, finances and deploy technical exchanges to Africans with the main goal of poverty reduction, industrial development and creating job opportunities.",
                            style: TextStyle(fontFamily: "IBMPlexSans"),
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Container(
                            height: 50,
                            width: 306,
                            decoration: BoxDecoration(
                                color: HexColor('#FC153B'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 17,),
                                Text(
                                  "Get Started",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right:9.0),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
