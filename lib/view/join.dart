import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  TextEditingController nick = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pac = TextEditingController();
  TextEditingController pa= TextEditingController();
  TextEditingController mail = TextEditingController();
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
                  String? value=height.text;

                  if(value!.indexOf("0")==0){

                    setState(() {
                      height.text= value.replaceFirst("0", "");
                    });

                  }
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
                            controller: mail,
                            
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,

                            onEditingComplete: ()
                                {
                                  String? value=mail.text;
                                  formkey.currentState!.validate();
                                  if(RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)){
                                  FocusScope.of(context).nextFocus();
                                }
                                  },
                            decoration: InputDecoration(
                              hintText: 'example@example.com',
                              border: OutlineInputBorder(),
                              labelText: '아이디',
                            ),
                            validator: (value){

                              if(value!=null&&value!="") {
                                if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return "이메일형식에 맞춰 주세요";
                                }
                              }else{
                                return "이메일을 입력 해주세요";
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
                                  controller: pa,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: (){

                                    String? value=pa.text;
                                    formkey.currentState!.validate();
                                    if(RegExp(
                                        r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/")
                                        .hasMatch(value)){
                                      FocusScope.of(context).nextFocus();
                                    }

                                  },
                                  validator: (value){

                                    if(value!=null&&value!="") {
                                      if (!RegExp(
                                          r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
                                          .hasMatch(value)) {
                                        return "특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내로 입력해주세요";
                                      }
                                    }else{
                                      return "비밀번호를 입력 해주세요";
                                    }
                                  },
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
                                  controller: pac,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    String? value=pac.text;
                                    formkey.currentState!.validate();
                                    if(pa.text==pac.text){

                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  validator: (value){

                                    if(value!=null&&value!="") {
                                      if(pa.text!=value){
                                        return "비밀번호와 일치하지 않습니다.";
                                      }
                                    }else{
                                      return "비밀번호를 입력 해주세요";
                                    }
                                  },
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
                            controller: phone,
                              textInputAction: TextInputAction.next,

                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9|-]'),
                                )
                              ],
                              onEditingComplete: (){
                                String? value=phone.text;
                                formkey.currentState!.validate();
                                if(RegExp(
                                    r"^\d{3}-\d{3,4}-\d{4}$")
                                    .hasMatch(value)){
                                  FocusScope.of(context).nextFocus();
                                }

                              },
                              validator: (value){

                                if(value!=null&&value!="") {
                                  if (!RegExp(
                                      r"^\d{3}-\d{3,4}-\d{4}$")
                                      .hasMatch(value)) {
                                    return "010-xxxx-xxxx형식으로 입력 해주세요";
                                  }
                                }else{
                                  return "핸드폰 번호를 입력해주세요";
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
                            controller: nick,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[ㄱ-ㅎ|가-힣]'))
                              ],
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: (){
                                String? value=nick.text;
                                formkey.currentState!.validate();
                                if(value.length>=3&&value.length<=5){
                                  FocusScope.of(context).nextFocus();
                                }

                              },
                              validator: (value){

                                if(value!=null&&value!="") {
                                  if (value.length<3||value.length>5) {
                                    return "이름은 3~5글자로 입력해주세요";
                                  }
                                }else{
                                  return "이름을 입력해주세요";
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

                              controller: height,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                              ],
                              onChanged: (val){
                                print(val.indexOf("0")==0);

                                },
                              onSaved: (val){

                                if(val!.indexOf("0")==0){

                                  setState(() {
                                    height.text= val.replaceFirst("0", "");
                                  });

                                }
                              },
                              onEditingComplete: (){
                                String? value=height.text;

                                if(value!.indexOf("0")==0){

                                  setState(() {
                                    height.text= value.replaceFirst("0", "");
                                  });

                                }
                                formkey.currentState!.validate();
                                if(int.parse(value)>=100&&int.parse(value)<=1000){
                                  FocusScope.of(context).nextFocus();
                                }

                              },
                              validator: (value){

                                if(value!=null&&value!="") {
                                  if (int.parse(value)<100||int.parse(value)>1000) {
                                    return "키를 100~1000이하로 입력해주세요";
                                  }
                                }else{
                                  return "키를 입력해주세요";
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
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ ElevatedButton(
                              onPressed: ()async{

                                if(!formkey.currentState!.validate()){
                                  print("정규식 틀렸는지 확인");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    // 스캐폴드메신저 만들기
                                    // 가장 가까운 스캐폴드 찾아서 반환해
                                    SnackBar(
                                      // 스낵바
                                      content: Text(
                                        '정확히 입력 하여 주세요',
                                        textAlign: TextAlign.center, // 중앙정렬
                                        style: TextStyle(color: Colors.white), // 텍스트
                                      ),
                                      backgroundColor: Colors.grey,
                                      duration: Duration(seconds: 1),

                                    ),

                                  );

                                }else{
                                  print("전송");

                                  var uri = await http.post(Uri.parse(
                                      "http://192.168.0.3:8080/join"),body: {
                                    "height":height.text,
                                    "name":nick.text,
                                    "phone":phone.text,
                                    "pass":pac.text,
                                    "id":mail.text,
                                    "gender":_character.toString().replaceFirst("gender.", "")
                                  });
                                  final parsed = json.decode(uri.body).cast<String, dynamic>();
                                  //성공여부 체크
                                  var tologinend = Navigator.pushNamed(context, "/");


                                }

                                },
                              child: Text("전송"),
                            ),],
                          )
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
