import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/MainPro.dart';
import 'package:untitled/widgets/MainAppBar.dart';
import 'package:untitled/widgets/MainBottomBar.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Main> createState() => Mainstate();
}

class Mainstate extends State<Main> {
  static final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomBar(),
      appBar: MainAppBar(),
      body: Consumer<MainPro>(
        builder: (context, MainProvider, child) => Container(
          color: Colors.white,
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '다음 소개까지 20시간 4분 남음',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(123, 123, 123, 0.8),
                              ),
                            ),
                          ]),
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 4; i++) ...[
                            GestureDetector(
                              onTap: MainProvider.moveProfile(4),
                              child: Container(
                                width: MainProvider.getimgW(context),
                                height: MainProvider.getimgH(context),
                                child: Card(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  shape: RoundedRectangleBorder(
                                    //모서리를 둥글게 하기 위해 사용
                                    borderRadius: BorderRadius.circular(
                                        MainProvider.cardRadius),
                                  ),
                                  elevation: 4.0,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                            "assets/images/1.jpg",
                                            fit: BoxFit.fill,
                                            width:
                                                MainProvider.getimgW(context)),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 30, 0),
                                        width: MainProvider.getimgW(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(
                                                MainProvider.cardRadius),
                                            bottomRight: Radius.circular(
                                                MainProvider.cardRadius),
                                          ),
                                          color: MainProvider.cardColor,
                                        ),
                                        child: Text(
                                          'fdfdsf',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ]),
                    Spacer(),
                  ],
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.mail, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ), //모서리를 둥글게

                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.purpleAccent,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            ),
                            Transform.rotate(
                              angle: -45,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(27.0),
                                  topRight: Radius.circular(27.0),
                                ),
                                child: Container(
                                  width: 55,
                                  height: 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [],
                                    color: Colors.red,
                                  ),
                                  margin: EdgeInsets.fromLTRB(1, 10, 0, 37),
                                  child: Text(
                                    MainProvider.btnBanTxt,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
