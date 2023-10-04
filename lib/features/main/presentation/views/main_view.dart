import 'package:flutter/material.dart';
import 'package:flutter_itargs_challange/features/main/presentation/views/widgets/settings_page.dart';

import '../../../../generated/l10n.dart';
import 'widgets/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, this.isChangingSettings});
  final bool? isChangingSettings;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SettingPage(),
  ];
  final List<Text> titles = [
    Text(S.current.Home_title),
    Text(S.current.More_title),
  ];

  @override
  void initState() {
    if (widget.isChangingSettings == true) {
      _currentIndex = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: titles[_currentIndex],
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: S.current.Home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.more),
              label: S.current.More,
            ),
          ],
        ),
      ),
    );
  }
}
