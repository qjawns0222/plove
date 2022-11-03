import 'package:flutter/material.dart';

class MainPro with ChangeNotifier {
  late double _imgH;
  late double _imgW;
  double _cardRadius = 10;
  Color _cardColor = Colors.purpleAccent;
  String _btnBanTxt = 'sale';

  Color get cardColor => _cardColor;

  set cardColor(Color value) {
    _cardColor = value;
  }

  double get cardRadius => _cardRadius;

  set cardRadius(double value) {
    _cardRadius = value;
  }

  double getimgH(BuildContext context) {
    _imgH = MediaQuery.of(context).size.height * 0.35;
    return _imgH;
  }

  set imgH(double value) {
    _imgH = value;
  }

  double getimgW(BuildContext context) {
    _imgH = MediaQuery.of(context).size.width * 0.45;
    return _imgH;
  }

  set imgW(double value) {
    _imgW = value;
  }

  String get btnBanTxt => _btnBanTxt;

  set btnBanTxt(String value) {
    _btnBanTxt = value;
  }

  moveProfile(int seq) {}
}
