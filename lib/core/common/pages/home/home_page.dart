import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todaily/features/profile/presentation/pages/profile/profile_page.dart';
import 'package:todaily/features/todo/presentation/pages/todos/todos_page.dart';

class Home extends StatefulWidget {
  static const String path = '/HomePage';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const Home();

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = [
    Todos.page(),
    Profile.page(),
  ];
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (pageIndex) {
          setState(() {
            _currentPageIndex = pageIndex;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Iconsax.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Iconsax.user,
            ),
          ),
        ],
      ),
    );
  }
}
