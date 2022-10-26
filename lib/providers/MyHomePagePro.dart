import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/models/UserModel.dart';

class MyHomePagePro with ChangeNotifier {
  bool _che = true;
  bool getChe() => _che;
  void setChe(che) => {this._che = che};

  Color _joinhover = Colors.black;
  Color getJoinhover() => _joinhover;
  void setJoinhover(joinhover) => {this._joinhover = joinhover};

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> getFormkey() => _formkey;
  void setFormkey(formkey) => {_formkey = formkey};

  FlutterSecureStorage _storage = new FlutterSecureStorage();
  FlutterSecureStorage getStorage() => _storage;
  void setStorage(storage) => {_storage = storage};

  TextEditingController _id = TextEditingController();
  TextEditingController getId() => _id;
  void setId(id) => {_id = id};

  TextEditingController _pass = TextEditingController();
  TextEditingController getPass() => _pass;
  void setPass(pass) => {_pass = pass};

//로그인 로직
  login(BuildContext context) async {
    var te = null;
    print(!_formkey.currentState!.validate());

    if (!_formkey.currentState!.validate() ||
        _id.text == "" ||
        _pass.text == "") {
      print("정규식 틀렸는지 확인");

      if (_id.text == "" || _pass.text == "") {
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
      var uri = await UserModel().LoginUri(_id, _pass);
      print('Response status: ${uri.statusCode}');
      print('Response body: ${uri.body}');

      if (uri.body == "") {
        _showDialog("로그인", "아이디가 존재 하지 않습니다.", context);
      } else {
        final parsed = json.decode(uri.body).cast<String, dynamic>();
        if (parsed['pass'] == null) {
          _showDialog("로그인", "비밀번호를 확인해 주세요", context);
        } else {
          await _storage.write(key: "token", value: parsed['pass']);
          String? token = await _storage.read(key: "token");
          print("토큰:${token}");
          var tologinend = Navigator.pushNamed(context, "/loginend");
        }
      }
    }
  }

//alert창 뛰우기
  void _showDialog(String title, String content, BuildContext context) {
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

  //비밀번호 보이기 안보이기
  void passVisible() {
    _che = !_che;
  }
}
