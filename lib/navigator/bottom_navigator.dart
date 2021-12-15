import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_template/navigator/my_navigator.dart';
import 'package:flutter_template/pages/home_page.dart';
import 'package:flutter_template/pages/me_page.dart';
import 'package:flutter_template/common/color.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  // 默认色
  final _defaultColor = Colors.grey;
  // 主题色
  final _activeColor = primaryColor;
  // 当前索引
  int _currentIndex = 0;
  // 页面
  List<Widget> _pages = [];

  static int initialPage = 0;
  final PageController _controller = PageController(initialPage: initialPage);

  /// 底部 Item
  BottomNavigationBarItem _bottomItem(String label, IconData icon, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon, color: _defaultColor),
      activeIcon: Icon(icon, color: _activeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      HomePage(),
      MePage(),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _activeColor,
        items: [
          _bottomItem('首页', Icons.home_outlined, 0),
          _bottomItem('我的', Icons.person_outline, 1),
        ],
      ),
    );
  }
}