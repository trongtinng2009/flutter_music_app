import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.onClickItem});
  final void Function(int id) onClickItem;

  @override
  State<StatefulWidget> createState() {
    return _StateBottomNavigation();
  }
}

class _StateBottomNavigation extends State<BottomNavigation> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          widget.onClickItem(value);
        });
      },
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
        ),
      ],
    );
  }
}
