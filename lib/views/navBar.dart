import 'package:crypto_wallet/views/home.dart';
import 'package:crypto_wallet/views/news.dart';
import 'package:crypto_wallet/views/search.dart';
import 'package:crypto_wallet/views/settings.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const NewsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 89, 255, 197).withOpacity(0.8),
              const Color.fromARGB(255, 89, 255, 197),
            ],
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xEEFAFA33),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/star_icon.png',
                height: myHeight * 0.03,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/star_icon2.png',
                height: myHeight * 0.03,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/search_icon2.png',
                height: myHeight * 0.03,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/search_icon.png',
                height: myHeight * 0.03,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/noti_icon2.png',
                height: myHeight * 0.03,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/noti_icon.png',
                height: myHeight * 0.03,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile_icon2.png',
                height: myHeight * 0.03,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/profile_icon.png',
                height: myHeight * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
