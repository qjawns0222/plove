import 'dart:convert';

import 'package:flutter/material.dart';

enum gender { man, woman }

class JoinPro with ChangeNotifier {
  gender _character = gender.man;
  gender getCharacter() => _character;
  void setCharacter(character) => {this._character = character};

  bool _pas = true;
  bool getPas() => _pas;
  void setPas(pas) => {this._pas = pas};

  bool _pasc = true;
  bool getPasc() => _pasc;
  void setPasc(pasc) => {this._pasc = pasc};

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormkey() => _formkey;
  void setFormkey(formkey) => {this._formkey = formkey};

  TextEditingController _height = TextEditingController();
  TextEditingController getHeight() => _height;
  void setPass(height) => {this._height = height};

  TextEditingController _nick = TextEditingController();
  TextEditingController getNick() => _nick;
  void setNick(nick) => {this._nick = nick};

  TextEditingController _phone = TextEditingController();
  TextEditingController getPhone() => _phone;
  void setPhone(phone) => {this._phone = phone};

  TextEditingController _pac = TextEditingController();
  TextEditingController getPac() => _pac;
  void setPac(pac) => {this._pac = pac};

  TextEditingController _pa = TextEditingController();
  TextEditingController getPa() => _pa;
  void setPa(pa) => {this._pa = pa};

  TextEditingController _mail = TextEditingController();
  TextEditingController getMail() => _mail;
  void setMail(mail) => {this._mail = mail};
//비밀번호 보이고 안보이고
  void pascounter() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.

    _pas = !_pas;
  }

//비밀번호 보이고 안보이고
  void pasccounter() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.

    _pasc = !_pasc;
  }

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
}
