import 'dart:convert';
import 'package:flutter/material.dart';

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
      body: Container(
        color: Color.fromRGBO(227, 230, 232, 0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("로그인 성공")],
          ),
        ),
      ),
    );
  }
}
