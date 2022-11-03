import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

enum gender { man, woman }

class JoinPro with ChangeNotifier {
  gender _character = gender.man;

  bool _pas = true;

  bool _pasc = true;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _height = TextEditingController();

  TextEditingController _nick = TextEditingController();

  TextEditingController _phone = TextEditingController();

  TextEditingController _pac = TextEditingController();

  TextEditingController _pa = TextEditingController();

  TextEditingController _mail = TextEditingController();

  gender get character => _character;

  set character(gender value) {
    _character = value;
  }

  bool get pas => _pas;

  set pas(bool value) {
    _pas = value;
  }

  bool get pasc => _pasc;

  set pasc(bool value) {
    _pasc = value;
  }

  GlobalKey<FormState> get formkey => _formkey;

  set formkey(GlobalKey<FormState> value) {
    _formkey = value;
  }

  TextEditingController get height => _height;

  set height(TextEditingController value) {
    _height = value;
  }

  TextEditingController get nick => _nick;

  set nick(TextEditingController value) {
    _nick = value;
  }

  TextEditingController get phone => _phone;

  set phone(TextEditingController value) {
    _phone = value;
  }

  TextEditingController get pac => _pac;

  set pac(TextEditingController value) {
    _pac = value;
  }

  TextEditingController get pa => _pa;

  set pa(TextEditingController value) {
    _pa = value;
  }

  TextEditingController get mail => _mail;

  set mail(TextEditingController value) {
    _mail = value;
  }
  //비밀번호 보이고 안보이고

  void pascounter() {
    _pas = !_pas;
  }

//비밀번호 보이고 안보이고
  void pasccounter() {
    _pasc = !_pasc;
  }

  //회원가입 로직
  JoinChe(context) async {
    var te = null;
    print(!_formkey.currentState!.validate());
    if (!_formkey.currentState!.validate() ||
        _height.text == "" ||
        _nick.text == "" ||
        _phone.text == "" ||
        _mail.text == "") {
      print("정규식 틀렸는지 확인");

      if (_height.text == "" ||
          _nick.text == "" ||
          _phone.text == "" ||
          _mail.text == "") {
        te = "빈 공간 없이 입력해주세요";
      } else {
        te = "정확히 입력 해주세요";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        // 스캐폴드메신저 만들기
        // 가장 가까운 스캐폴드 찾아서 반환해
        SnackBar(
          // 스낵바
          content: Text(
            te,
            textAlign: TextAlign.center, // 중앙정렬
            style: TextStyle(color: Colors.white), // 텍스트
          ),
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      print("전송");

      var uri =
          await http.post(Uri.parse("http://192.168.0.116:8080/join"), body: {
        "heightstr": _height.text,
        "name": _nick.text,
        "phone": _phone.text,
        "pass": _pac.text,
        "id": _mail.text,
        "gender": _character.toString().replaceFirst("gender.", "")
      });
      final parsed = json.decode(uri.body);
      print(uri.body);

      //성공여부 체크
      var tologinend = Navigator.pushNamed(context, "/");
    }
  }

  //gesturedetectur tap
  void Gtap() {
    String? value = _height.text;
    formkey.currentState!.validate();

    if (value!.indexOf("0") == 0) {
      _height.text = value.replaceFirst("0", "");
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  //mail edit
  void Medit(context) {
    String? value = _mail.text;
    _formkey.currentState!.validate();
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      FocusScope.of(context).nextFocus();
    }
  }

  //pass edit
  void Pedit(context) {
    String? value = _pa.text;
    _formkey.currentState!.validate();
    if (RegExp(r"^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/")
        .hasMatch(value)) {
      FocusScope.of(context).nextFocus();
    }
  }

  //passcheck edit
  void Pcedit(context) {
    String? value = _pac.text;
    _formkey.currentState!.validate();
    if (_pa.text == _pac.text) {
      FocusScope.of(context).nextFocus();
    }
  }

  //phone edit
  void Phonecheck(context) {
    String? value = _phone.text;
    _formkey.currentState!.validate();
    if (RegExp(r"^\d{3}-\d{3,4}-\d{4}$").hasMatch(value)) {
      FocusScope.of(context).nextFocus();
    }
  }

  //nick edit
  void Nickedit(context) {
    String? value = _nick.text;
    _formkey.currentState!.validate();
    if (value.length >= 3 && value.length <= 5) {
      FocusScope.of(context).nextFocus();
    }
  }

  //height edit
  void Heightedit(context) {
    String? value = _height.text;

    if (value!.indexOf("0") == 0) {
      _height.text = value.replaceFirst("0", "");
    }
    _formkey.currentState!.validate();
    if (int.parse(value) >= 100 && int.parse(value) <= 1000) {
      FocusScope.of(context).nextFocus();
    }
  }

  //height saved
  void Heightsave(val) {
    if (val!.indexOf("0") == 0) {
      _height.text = val.replaceFirst("0", "");
    }
  }

  //gender change
  void Genderchange(value) {
    _character = value;
  }
}
