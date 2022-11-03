import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/JoinPro.dart';

class join extends StatefulWidget {
  const join({super.key});
  State<join> createState() => _joinState();
}

class _joinState extends State<join> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
        body: Consumer<JoinPro>(
          builder: (context, MainProvider, child) => Form(
            key: MainProvider.formkey,
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => MainProvider.Gtap(),
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
                            controller: MainProvider.mail,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                MainProvider.Medit(context),
                            decoration: InputDecoration(
                              hintText: 'example@example.com',
                              border: OutlineInputBorder(),
                              labelText: '아이디',
                            ),
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
                                  controller: MainProvider.pa,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      MainProvider.Pedit(context),
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
                                  obscureText: MainProvider.pas,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '비밀번호를 입력 하세요',
                                    labelText: '비밀번호',
                                    suffixIcon: IconButton(
                                      onPressed: MainProvider.pascounter,
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
                                  controller: MainProvider.pac,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      MainProvider.Pcedit(context),
                                  validator: (value) {
                                    if (value != null && value != "") {
                                      if (MainProvider.pa.text != value) {
                                        return "비밀번호와 일치하지 않습니다.";
                                      }
                                    } else {
                                      return null;
                                    }
                                  },
                                  obscureText: MainProvider.pasc,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '비밀번호를 다시 한 번 입력하세요',
                                    labelText: '비밀번호 확인',
                                    suffixIcon: IconButton(
                                      onPressed: MainProvider.pasccounter,
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
                                  groupValue: MainProvider.character,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  onChanged: (value) =>
                                      MainProvider.Genderchange(value),
                                ),
                              )),
                              Expanded(
                                  child: ListTile(
                                title: const Text('여성'),
                                leading: Radio<gender>(
                                  value: gender.woman,
                                  groupValue: MainProvider.character,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green),
                                  onChanged: (value) =>
                                      MainProvider.Genderchange(value),
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
                              controller: MainProvider.phone,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9|-]'),
                                )
                              ],
                              onEditingComplete: () =>
                                  MainProvider.Phonecheck(context),
                              validator: (value) {
                                if (value != null && value != "") {
                                  if (!RegExp(r"^\d{3}-\d{3,4}-\d{4}$")
                                      .hasMatch(value)) {
                                    return "010-xxxx-xxxx형식으로 입력 해주세요";
                                  }
                                } else {
                                  return null;
                                }
                              },
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
                              controller: MainProvider.nick,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[ㄱ-ㅎ|가-힣]'))
                              ],
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  MainProvider.Nickedit(context),
                              validator: (value) {
                                if (value != null && value != "") {
                                  if (value.length < 3 || value.length > 5) {
                                    return "이름은 3~5글자로 입력해주세요";
                                  }
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'ex)홍길동',
                                border: OutlineInputBorder(),
                                labelText: '이름',
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: TextFormField(
                              textInputAction: TextInputAction.next,
                              controller: MainProvider.height,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onSaved: (val) => MainProvider.Heightsave(val),
                              onEditingComplete: () =>
                                  MainProvider.Heightedit(context),
                              validator: (value) {
                                if (value != null && value != "") {
                                  if (int.parse(value) < 100 ||
                                      int.parse(value) > 1000) {
                                    return "키를 100~1000이하로 입력해주세요";
                                  }
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'cm',
                                  border: OutlineInputBorder(),
                                  labelText: '키',
                                  suffix: Text("cm"))),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      MainProvider.JoinChe(context),
                                  child: Text("전송"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
