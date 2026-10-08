import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbarWidget extends StatefulWidget {
  const BottomNavbarWidget({super.key});

  @override
  State<BottomNavbarWidget> createState() => _BottomNavbarWidgetState();
}

class _BottomNavbarWidgetState extends State<BottomNavbarWidget> {
  final List<Widget> list = const [
    Text('Home'),
    Text('Cart'),
    Text('Favorite'),
    Text('User'),
  ];

  int _selectedIndex = 0;

  final List<Map<String, String>> menuItems = [
    {
      'icon': 'assets/icons/home_.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/cart_.svg',
      'label': 'Cart',
    },
    {
      'icon': 'assets/icons/favorite.svg',
      'label': 'Favorite',
    },
    {
      'icon': 'assets/icons/profile_.svg',
      'label': 'Profile',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navbar"),
      ),

      body: Center(
        child: list[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        // Menampilkan tulisan di bawah ikon
        showUnselectedLabels: true,
        showSelectedLabels: true,

        type: BottomNavigationBarType.fixed,
        elevation: 32.0,

        items: menuItems.map((i) {
          return BottomNavigationBarItem(
            // Ikon ketika dipilih
            activeIcon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: SvgPicture.asset(
                i['icon']!,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),

            // Ikon ketika tidak dipilih
            icon: SvgPicture.asset(
              i['icon']!,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),

            // Tulisan di bawah ikon
            label: i['label'],
          );
        }).toList(),

        // Menentukan menu yang sedang dipilih
        currentIndex: _selectedIndex,

        // Warna tulisan/ikon yang aktif
        selectedItemColor: Colors.blue,

        // Fungsi ketika menu diklik
        onTap: _onItemTapped,
      ),
    );
  }
}