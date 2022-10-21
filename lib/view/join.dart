import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class join extends StatefulWidget {
  const join({super.key});
  State<join> createState() => _joinState();
}

enum gender { man, woman }

class _joinState extends State<join> {
  gender? _character = gender.man;
  bool pas = true;
  bool pasc = true;
  final formkey = GlobalKey<FormState>();
  TextEditingController height = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void pascounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.

        pas = !pas;
      });
    }

    void pasccounter() {
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.

        pasc = !pasc;
      });
    }

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('회원가입'),

          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 5.0,
        ),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                color: Color.fromRGBO(227, 230, 232, 0.3),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              {FocusScope.of(context).nextFocus()},
                          decoration: InputDecoration(
                            hintText: 'example@example.com',
                            border: OutlineInputBorder(),
                            labelText: '아이디',
                          ),
                          validator: (value) => "d",
                        ),
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
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () =>
                                    {FocusScope.of(context).nextFocus()},
                                obscureText: pas,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '비밀번호를 입력 하세요',
                                  labelText: '비밀번호',
                                  suffixIcon: IconButton(
                                    onPressed: pascounter,
                                    icon: Icon(Icons.remove_red_eye_rounded),
                                  ),
                                ),
                              ),
                            ),
                          ])),
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
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () =>
                                    {FocusScope.of(context).nextFocus()},
                                obscureText: pasc,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '비밀번호를 다시 한 번 입력하세요',
                                  labelText: '비밀번호 확인',
                                  suffixIcon: IconButton(
                                    onPressed: pasccounter,
                                    icon: Icon(Icons.remove_red_eye_rounded),
                                  ),
                                ),
                              ),
                            ),
                          ])),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text("성별")],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                child: ListTile(
                              title: const Text('남성'),
                              leading: Radio<gender>(
                                value: gender.man,
                                groupValue: _character,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.green),
                                onChanged: (gender? value) {
                                  print(value);
                                  setState(() {
                                    _character = value;
                                  });
                                  print(_character);
                                },
                              ),
                            )),
                            Expanded(
                                child: ListTile(
                              title: const Text('여성'),
                              leading: Radio<gender>(
                                value: gender.woman,
                                groupValue: _character,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.green),
                                onChanged: (gender? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                  print(_character);
                                },
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                {FocusScope.of(context).nextFocus()},
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              )
                            ],
                            decoration: InputDecoration(
                              hintText: '010-xxxx-xxxx',
                              border: OutlineInputBorder(),
                              labelText: '휴대폰 번호',
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[ㄱ-ㅎ|가-힣]'))
                            ],
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                {FocusScope.of(context).nextFocus()},
                            decoration: InputDecoration(
                              hintText: 'ex)프러브매니저',
                              border: OutlineInputBorder(),
                              labelText: '별명',
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                {FocusScope.of(context).nextFocus()},
                            controller: height,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                            decoration: InputDecoration(
                                hintText: 'cm',
                                border: OutlineInputBorder(),
                                labelText: '키',
                                suffix: Text("cm"))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
