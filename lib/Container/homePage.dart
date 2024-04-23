import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:fluttertest/Container/accountPage.dart';
import 'package:fluttertest/Logic/Authentication.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../Service/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  MainPage createState() => MainPage();
}

class MainPage extends State<HomePage> {
  String name = "";
  String money = "";
  bool isTextVisible = true;
  void getDataUser() async {
    HttpRequest instance = HttpRequest();
    await instance.getData();
    setState(() {
      money = instance.money;
      name = instance.name;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  Future<void> _handleRefresh() async {
    HttpRequest instance = HttpRequest();
    await instance.getData();
    setState(() {
      name = instance.name;
      money = instance.money;
    });
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 80,
        color: HexColor('#0D3A56'),
        showChildOpacityTransition: false,
        animSpeedFactor: 20,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0)),
                    IconButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_alert_sharp,
                          color: Colors.white,
                          size: 30,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/bakong.png',
                        width: 40,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Image.asset(
                        'assets/nopf.png',
                        width: 70,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'សួស្តី,${name}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const Text(
                          'មើលប្រូហ្វាល>',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Container(
                    // color:
                    width: 370,
                    height: 150,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.black12,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black,
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  isTextVisible
                                      ? Text(
                                          '\$ $money',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      : const Text(
                                          '\$ XXX.XX',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                  IconButton(
                                    icon: isTextVisible ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        isTextVisible = !isTextVisible;
                                      });
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.teal),
                                    padding: const EdgeInsets.all(3),
                                    child: const Text(
                                      'គណនីគោល',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: const Text(
                                      'Saving Account with ATM facility',
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 5, 0),
                                            child: Image.asset(
                                              'assets/income.png',
                                              width: 25,
                                            )),
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          child: Text(
                                            'ទទួលលុយចូល',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 5, 0),
                                                child: Image.asset(
                                                  'assets/outcome.png',
                                                  width: 25,
                                                )),
                                            const Text(
                                              'ផ្ញើលុយចេញ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                const Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: 370,
                  height: 350,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {
                                      // bool auth = await Auth.authentication();
                                      // print('Authentication now');
                                      // if(auth){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AccountPage()));
                                      // }
                                      // Navigator.pushNamed(context, '/account');
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                RadialGradient(
                                                  center: Alignment.topCenter,
                                                  stops: [.5, 1, 1],
                                                  colors: [
                                                    HexColor('#005E86'),
                                                    Colors.white70,
                                                    HexColor('#005E86'),
                                                  ],
                                                ).createShader(bounds),
                                            child: const Icon(
                                              Icons.wallet_rounded,
                                              size: 50,
                                            )),
                                        const Text(
                                          'គណនី',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                RadialGradient(
                                                  center: Alignment.center,
                                                  stops: [.5, 1, 1],
                                                  colors: [
                                                    HexColor('#005E86'),
                                                    Colors.white70,
                                                    HexColor('#005E86'),
                                                  ],
                                                ).createShader(bounds),
                                            child: const Icon(
                                              Icons.credit_card,
                                              size: 50,
                                            )),
                                        const Text(
                                          'កាត',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                RadialGradient(
                                                  center: Alignment.topCenter,
                                                  stops: [.5, 1, 1],
                                                  colors: [
                                                    HexColor('#005E86'),
                                                    Colors.white70,
                                                    HexColor('#005E86'),
                                                  ],
                                                ).createShader(bounds),
                                            child: const Icon(
                                              Icons.attach_money,
                                              size: 50,
                                            )),
                                        const Text(
                                          'ទូទាត់',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              )
                            ],
                          )),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                RadialGradient(
                                                  center: Alignment.topCenter,
                                                  stops: [.5, 1, 1],
                                                  colors: [
                                                    HexColor('#005E86'),
                                                    Colors.white70,
                                                    HexColor('#005E86'),
                                                  ],
                                                ).createShader(bounds),
                                            child: const Icon(
                                              Icons.qr_code_2,
                                              size: 50,
                                            )),
                                        const Text(
                                          'ABAស្កែន',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcIn,
                                            shaderCallback: (Rect bounds) =>
                                                RadialGradient(
                                                  center: Alignment.topCenter,
                                                  stops: [.5, 1, 1],
                                                  colors: [
                                                    HexColor('#005E86'),
                                                    Colors.white70,
                                                    HexColor('#005E86'),
                                                  ],
                                                ).createShader(bounds),
                                            child: const Icon(
                                              Icons.star,
                                              size: 50,
                                            )),
                                        const Text(
                                          'គំរូទូទាត់',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                width: 105,
                                height: 105,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ShaderMask(
                                          blendMode: BlendMode.srcIn,
                                          shaderCallback: (Rect bounds) =>
                                              RadialGradient(
                                            center: Alignment.topCenter,
                                            stops: [.5, 1, 1],
                                            colors: [
                                              HexColor('#005E86'),
                                              Colors.white70,
                                              HexColor('#005E86'),
                                            ],
                                          ).createShader(bounds),
                                          child: const Icon(
                                            Icons.compare_arrows,
                                            size: 50,
                                          ),
                                        ),
                                        const Text(
                                          'ផ្ទេរប្រាក់',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )
                                      ],
                                    )),
                              )
                            ],
                          )),
                      const Divider(
                        height: 10,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 70,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (Rect bounds) =>
                                                  RadialGradient(
                                                    center: Alignment.topCenter,
                                                    stops: [.5, 1, 1],
                                                    colors: [
                                                      HexColor('#005E86'),
                                                      Colors.white70,
                                                      HexColor('#005E86'),
                                                    ],
                                                  ).createShader(bounds),
                                              child: const Icon(
                                                Icons.account_balance_outlined,
                                                size: 50,
                                              )),
                                          // Adding space between icon and text
                                          const Text(
                                            'សេវាស្ថាប័នរដ្ធាភិបាល',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    decoration: const BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (Rect bounds) =>
                                                  RadialGradient(
                                                    center: Alignment.topCenter,
                                                    stops: [.5, 1, 1],
                                                    colors: [
                                                      HexColor('#005E86'),
                                                      Colors.white70,
                                                      HexColor('#005E86'),
                                                    ],
                                                  ).createShader(bounds),
                                              child: const Icon(
                                                Icons.local_atm,
                                                size: 50,
                                              )),
                                          // Adding space between icon and text
                                          const Text(
                                            'ផ្ញើប្រាក់ទៅ ATM',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ដំណីង & ប្រូម៉ូសិន',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 370,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/leo.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
