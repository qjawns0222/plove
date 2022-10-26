import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/MyHomePagePro.dart';

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
//로그인 처리

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
        body: Consumer<MyHomePagePro>(
          builder: (context, MainProvider, child) => Form(
            key: MainProvider.getFormkey(),
            child: SingleChildScrollView(
              child: GestureDetector(
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
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                String? value = MainProvider.getId().text;
                                MainProvider.getFormkey()
                                    .currentState!
                                    .validate();
                                if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (value) {
                                if (value != null && value != "") {
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return "이메일형식에 맞춰 주세요";
                                  }
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: MainProvider.getId(),
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
                                child: TextFormField(
                                  onFieldSubmitted: (s) {
                                    MainProvider.login(context);
                                  },
                                  textInputAction: TextInputAction.done,
                                  onEditingComplete: () {
                                    String? value = MainProvider.getPass().text;
                                    MainProvider.getFormkey()
                                        .currentState!
                                        .validate();
                                    if (RegExp(
                                            r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/")
                                        .hasMatch(value)) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (value) {
                                    if (value != null && value != "") {
                                      if (!RegExp(
                                              r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
                                          .hasMatch(value)) {
                                        return "특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내로 입력해주세요";
                                      }
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: MainProvider.getPass(),
                                  obscureText: MainProvider.getChe(),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '비밀번호를 입력 하세요',
                                    labelText: '비밀번호',
                                    suffixIcon: IconButton(
                                      onPressed: MainProvider.passVisible,
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
                          onPressed: () => MainProvider.login(context),
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
                              var tojoin =
                                  Navigator.pushNamed(context, "/join");
                            },
                            onHover: (ds) {
                              setState(() {
                                ds
                                    ? MainProvider.setJoinhover(Colors.red)
                                    : MainProvider.setJoinhover(Colors.black);
                              });
                            },
                            child: Text(
                              "회원가입",
                              style:
                                  TextStyle(color: MainProvider.getJoinhover()),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // This trailing comma makes auto-formatting nicer for build methods.
                ),
              ),
            ),
          ),
        ));
  }
}
