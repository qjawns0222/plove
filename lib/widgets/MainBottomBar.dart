import 'package:flutter/material.dart';

class MainBottomBar extends StatefulWidget implements PreferredSizeWidget {
  const MainBottomBar({super.key});

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 5,
    vsync: this, //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              // POINT
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        height: 50,
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.purple,
          tabs: [
            Tab(
                icon: Icon(
                  Icons.home,
                  size: 18,
                ),
                child: Text(
                  '홈',
                  style: TextStyle(
                    fontSize: 9,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.home,
                  size: 18,
                ),
                child: Text(
                  '홈',
                  style: TextStyle(
                    fontSize: 9,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.search,
                  size: 18,
                ),
                child: Text(
                  '검색',
                  style: TextStyle(
                    fontSize: 9,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.save_alt,
                  size: 18,
                ),
                child: Text(
                  '저장 목록',
                  style: TextStyle(
                    fontSize: 9,
                  ),
                )),
            Tab(
                icon: Icon(
                  Icons.list,
                  size: 18,
                ),
                child: Text(
                  '더 보기',
                  style: TextStyle(
                    fontSize: 9,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
