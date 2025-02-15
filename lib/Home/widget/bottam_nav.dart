import 'package:ecommerce_app/Home/screens/watchlist.dart';
import 'package:flutter/material.dart';
import '../screens/cart.dart';
import '../screens/homePage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 2;  // Default to HomePage

  final List<Widget> screens = const [
    Scaffold(),
    WatchList(),
    HomePage(),
    Cart(),
    Scaffold(),
  ];

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2), // Always navigate to HomePage
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF3D3BF3),
        child: const Icon(Icons.home, size: 25, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(Icons.grid_view_outlined, size: 25, color: _currentIndex == 0 ? const Color(0xFF3D3BF3) : Colors.grey.shade400),),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: Icon(Icons.favorite_border_outlined, size: 25, color: _currentIndex == 1 ? const Color(0xFF3D3BF3) : Colors.grey.shade400),),
            const SizedBox(width: 15), // Space for FAB
            IconButton(
              onPressed: () => _onItemTapped(3),
              icon: Icon(Icons.shopping_cart_outlined, size: 25, color: _currentIndex == 3 ? const Color(0xFF3D3BF3) : Colors.grey.shade400),),
            IconButton(
              onPressed: () => _onItemTapped(4),
              icon: Icon(Icons.person, size: 25, color: _currentIndex == 4 ? const Color(0xFF3D3BF3) : Colors.grey.shade400),
            ),
          ],
        ),
      ),
      body: screens[_currentIndex], // Show the selected screen
    );
  }
}
