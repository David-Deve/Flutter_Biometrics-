import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#0D3A56'),
        iconTheme: IconThemeData(),
      ),
      body: ListView(
        children: [
          Text('Accounting Page')
        ],
      ),
    );
  }
}
