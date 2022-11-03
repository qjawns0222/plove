import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.

      leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '다이아매치',
          textAlign: TextAlign.center,
        ),
      ]),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.diamond_rounded)),
          Text("33")
        ],
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 5.0,
      leadingWidth: 100,
    );
  }
}
