import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class loginend extends StatefulWidget {
  const loginend({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<loginend> createState() => loginendstate();
}

class loginendstate extends State<loginend> {
  static final storage = new FlutterSecureStorage();
  String token = "";
  String? tokentmp;
  gettoken() async {
    tokentmp = await storage.read(key: 'token');
    if (tokentmp == null) {
      var tohome = Navigator.pushNamed(context, "/");
    }
    return tokentmp;
  }

  move() async {
    gettoken().then((value) => {
          //print("${value.toString()}"),
          setState(() {
            token = value;
          })
        });
  }

  check() async {
    await move();
  }

  @override
  Widget build(BuildContext context) {
    check();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('로그인 완료'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Container(
        color: Color.fromRGBO(227, 230, 232, 0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(token)],
          ),
        ),
      ),
    );
  }
}
