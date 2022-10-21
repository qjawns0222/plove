import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/view/join.dart';
import 'class/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/join",
      routes: {
        '/': (context) => MyHomePage(title: '로그인'),
        '/loginend': (context) => loginend(),
        '/join': (context) => join(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool che = true;
  Color _joinhover = Colors.black;
  static final storage = new FlutterSecureStorage();
  TextEditingController id = TextEditingController();
  TextEditingController pass = TextEditingController();
  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(content),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(146, 17, 198, 0.5),
                foregroundColor: Colors.white,
              ),
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

//로그인 처리
  void move() async {
    var uri = await http.get(Uri.parse(
        "http://192.168.0.116:8080/hi?id=${id.text}&pass=${pass.text}"));
    print('Response status: ${uri.statusCode}');
    print('Response body: ${uri.body}');

    if (uri.body == "") {
      _showDialog("로그인", "아이디가 존재 하지 않습니다.");
    } else {
      final parsed = json.decode(uri.body).cast<String, dynamic>();
      if (parsed['pass'] == null) {
        _showDialog("로그인", "비밀번호를 확인해 주세요");
      } else {
        await storage.write(key: "token", value: parsed['pass']);
        String? token = await storage.read(key: "token");
        print("토큰:${token}");
        var tologinend = Navigator.pushNamed(context, "/loginend");
      }
    }
    login("iea", "hello12!");
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      che = !che;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5.0,
      ),
      body: GestureDetector(
        onTap: () {
          print("object");
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: Color.fromRGBO(227, 230, 232, 0.3),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color.fromRGBO(227, 230, 232, 1),
                        width: 1.0,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                      controller: id,
                      decoration: InputDecoration(
                        hintText: '아이디를 입력 하세요',
                        border: OutlineInputBorder(),
                        labelText: '아이디',
                      )),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          // POINT
                          color: Color.fromRGBO(227, 230, 232, 1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: pass,
                          obscureText: che,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '비밀번호를 입력 하세요',
                            labelText: '비밀번호',
                            suffixIcon: IconButton(
                              onPressed: _incrementCounter,
                              icon: Icon(Icons.remove_red_eye_rounded),
                            ),
                          ),
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: move,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(146, 17, 198, 0.5),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('로그인'),
                ),
                InkWell(
                  onHover: (s) {
                    print("df");
                  },
                  child: TextButton(
                    onPressed: () {
                      var tojoin = Navigator.pushNamed(context, "/join");
                    },
                    onHover: (ds) {
                      setState(() {
                        ds
                            ? _joinhover = Colors.red
                            : _joinhover = Colors.black;
                      });
                    },
                    child: Text(
                      "회원가입",
                      style: TextStyle(color: _joinhover),
                    ),
                  ),
                )
              ],
            ),
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

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
  String? token;
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
          token = value,
          print("${token}"),
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
            children: [Text('${token}')],
          ),
        ),
      ),
    );
  }
}
