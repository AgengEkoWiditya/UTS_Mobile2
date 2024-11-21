import 'package:flutter/material.dart';
import 'resep_page.dart';
import 'favorite_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ResepPage(),
    FavoritePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan background lebih elegan dan transparan
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900.withOpacity(0.8),
        title:const Text(
          'Buku Resep',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_selectedIndex], // Halaman yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800, // Warna item yang dipilih
        unselectedItemColor: Colors.blue.shade300, // Warna item yang tidak dipilih
        backgroundColor: Colors.blue.shade50, // Background Bottom Navigation Bar
        onTap: _onItemTapped,
      ),
    );
  }
}
